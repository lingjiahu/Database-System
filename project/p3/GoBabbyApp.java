package project.p3;

import java.awt.print.PrinterGraphics;
import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class GoBabbyApp {
    public static void main(String[] args) throws SQLException {
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }

        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        String your_userid = null;
        String your_password = null;
        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }

        Connection con = DriverManager.getConnection(url, your_userid, your_password);

        // step 1: ask for pid
        Scanner s = new Scanner(System.in);
        String pid = null;
        while (pid == null) {
            System.out.println("Please enter your practitioner id [E] to exit:");
            String inputPID = s.nextLine();
            if (inputPID.equals("E")) {           // close db connection and exit
                con.close();
                return;
            }
            pid = isValidPID(con, inputPID);
        }

        // step 2: ask for appointment date
        while (true) {
            System.out.println("Please enter the date (YYYY-MM-DD) for appointment list [E] to exit:");
            String inputDate = s.nextLine();
            if (inputDate.equals("E")) {           // close db connection and exit
                con.close();
                return;
            } else if (inputDate.equals("D")) {  // return to choose date
                continue;
            }

            // step 3: choose appointment
            while (true) {
                // list all the appointments for that date for that midwife, ordered by time
                ArrayList<Appointment> appointments = getAppointments(con, pid, inputDate);
                if (appointments == null) { // If there are no appointments for that date, go back to asking for the date.
                    continue;
                }

                displayAppointments(appointments);
                System.out.println("Enter the appointment number that you would like to work on.\n " +
                        "                [E] to exit [D] to go back to another date :");
                String inputAppt = s.nextLine();
                if (inputAppt.equals("E")) {           // close db connection and exit
                    con.close();
                    return;
                } else if (inputAppt.equals("D")) {  // return to choose date
                    break;  // break out from while loop for choose appointments, get back to choose date
                }
                int idx = Integer.parseInt(inputAppt);
                // step 4: ask for action
                Appointment appt = appointments.get(idx-1);
                String mname = appt.getMname();
                String mramq = appt.getMramq();
                int choice = displayOptions(mname, mramq);
                while (choice > 0) {
                    switch (choice) {
                        case 1:
                            reviewNotes(con, appt.getPrg());
                            choice = displayOptions(mname, mramq);
                            break;
                        case 2:
                            reviewTests(con, appt);
                            choice =  displayOptions(mname, mramq);
                            break;
                        case 3:
                            addNote(con);
                            choice = displayOptions(mname, mramq);
                            break;
                        case 4:
                            prescribeTest(con);
                            choice = displayOptions(mname, mramq);
                            break;
                        case 5:
                            // break out the while loop for choose option
                            // get back to the while loop for choose appointment
                            choice = 0;
                            break;
                    }
                }
            }
        }
    }

    // return pid if the input pid is valid, otherwise return null
    static String isValidPID(Connection con, String pid) throws SQLException {
        String querySQL = "SELECT pid FROM midwives WHERE pid = " + pid;
        Statement statement = con.createStatement();
        java.sql.ResultSet rs = statement.executeQuery(querySQL);
        String validPID = null;
        if (rs.next()) {
            validPID = rs.getString("PID");

        }
        rs.close();
        statement.close();
        return validPID;
    }

    // return a list of appointments for the midwife on the day
    static ArrayList<Appointment> getAppointments(Connection con, String pid, String date) throws SQLException {
        String querySQL = "WITH motherinfo(mname, mramq, cid) AS (" +
                "SELECT m.mname, m.mramq, c.cid " +
                "FROM mothers m join COUPLES c ON m.mramq = c.mramq), mwrole(cid, birthym, role) " +
                "AS (SELECT cid, birthym, 'P' AS role" +
                " FROM Pregnancies p1 WHERE p1.ppid = " + pid +
                " UNION" +
                " SELECT cid, birthym, 'B' AS role" +
                " FROM Pregnancies p2 WHERE p2.bpid = " + pid + ")" +
                "SELECT a.aid, a.apptime, r.role, mi.mname, mi.mramq, r.cid, r.birthym" +
                " FROM appointments a JOIN motherinfo mi ON a.cid = mi.cid" +
                " JOIN mwrole r ON a.cid = r.cid AND a.birthym = r.birthym" +
                " WHERE pid = " + pid + " AND apptdate = " + "\'" + date + "\'";
        Statement statement = con.createStatement();
        java.sql.ResultSet rs = statement.executeQuery(querySQL);
        ArrayList<Appointment> appts = new ArrayList<>();
        while (rs.next()) {
            Appointment app = new Appointment();
            app.setAid(rs.getString("aid"));
            app.setApptime(rs.getString("apptime"));
            app.setMwrole(rs.getString("role"));
            app.setMname(rs.getString("mname"));
            app.setMramq(rs.getString("mramq"));
            Pregnancy prg = new Pregnancy();
            prg.setCid(rs.getString("cid"));
            prg.setBirthym(rs.getString("birthym"));
            app.setPrg(prg);
            appts.add(app);
        }
        rs.close();
        statement.close();
        return appts;
    }

    static void displayAppointments(ArrayList<Appointment> appts) {
        for (int i = 0; i < appts.size(); i++) {
            System.out.print(i+1 + ":" + "  ");
            System.out.print(appts.get(i).getApptime() + " ");
            System.out.print(appts.get(i).getMwrole() + " ");
            System.out.print(appts.get(i).getMname() + " ");
            System.out.println(appts.get(i).getMramq());
        }
        System.out.println();
    }

    // display all options for the current Mother, return the option number
    static int displayOptions(String name, String ramq) {
        System.out.println(
                "For" + name + " " +  ramq + "\n\n" +
                        "1. Review notes\n" +
                        "2. Review tests\n" +
                        "3. Add a note\n" +
                        "4. Prescribe a test\n" +
                        "5. Go back to the appointments.\n\n" +
                        "Enter your choice:");
        Scanner s = new Scanner(System.in);
        return s.nextInt();
    }

    // list all the notes relevant for this pregnancy
    static void reviewNotes(Connection con, Pregnancy prg) throws SQLException {
        String querySQL = "WITH appts(aid) AS" +
                " (SELECT a.aid" +
                " FROM appointments a JOIN pregnancies p ON a.cid = p.cid AND a.birthym = p.birthym AND p.cid = " + prg.getCid() + " AND p.birthym = " + "\'" + prg.getBirthym() + "\')" +
                "SELECT n.notedate, n.notetime, SUBSTR(n.notemsg, 1, 50) notemsg" +
                " FROM notes n JOIN appts ON n.aid = appts.aid" +
                " ORDER BY n.notedate DESC";
        Statement statement = con.createStatement();
        java.sql.ResultSet rs = statement.executeQuery(querySQL);
        while (rs.next()) {
            System.out.print(rs.getString("notedate") + " ");
            System.out.print(rs.getString("notetime") + " ");
            System.out.println(rs.getString("notemsg") + " ");
        }
        rs.close();
        statement.close();
    }

    // list all the tests relevant for this pregnancy (but only the tests relevant for the mother)
    static void reviewTests(Connection con, Appointment appt) throws SQLException {
        String querySQL = "";
        Statement statement = con.createStatement();
        java.sql.ResultSet rs = statement.executeQuery(querySQL);
        while (rs.next()) {
            System.out.print(rs.getString(""));
        }
        rs.close();
        statement.close();
    }

    // let the user type in a text (note) that is then stored into the system
    // use the current date and time
    // TODO
    static void addNote(Connection con) throws SQLException {
        System.out.println("Please type your observation:");
        Scanner s = new Scanner(System.in);
        String msg = s.nextLine();
        String insertSQL = "";
        Statement statement = con.createStatement();
        statement.executeUpdate ( insertSQL ) ;


        statement.close();
    }

    // let the user enter the type of test that is being prescribed and that will be recorded in the system.
    // assume that test is for the mother
    // prescription date and sample date of the test is the date on which the test prescription is being entered
    // use the current date and time
    // TODO
    static void prescribeTest(Connection con) throws SQLException {
        System.out.println("Please enter the type of test:");
        Scanner s = new Scanner(System.in);
        String msg = s.nextLine();
        String insertSQL = "";
        Statement statement = con.createStatement();
        statement.executeUpdate ( insertSQL ) ;

        statement.close();
    }
}
