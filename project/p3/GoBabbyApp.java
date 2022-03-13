package project.p3;

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
            if (inputPID == "E") {           // close db connection and exit
                con.close();
                return;
            }
            pid = isValidPID(con, inputPID);
        }

        // step 2: ask for appointment date
        while (true) {
            System.out.println("Please enter the date (YYYY-MM-DD) for appointment list [E] to exit:");
            String inputDate = s.nextLine();
            if (inputDate == "E") {           // close db connection and exit
                con.close();
                return;
            } else if (inputDate == "D") {  // return to choose date
                continue;
            }

            // list all the appointments for that date for that midwife, ordered by time
            ArrayList<Appointment> appointments = getAppointments(inputDate);
            if (appointments == null) { // If there are no appointments for that date, go back to asking for the date.
                continue;
            }

            // step 3: choose appointment
            while (true) {
                displayAppointments(appointments);
                System.out.println("\n Enter the appointment number that you would like to work on. [E] to exit [D] to go back to another date :");
                String inputAppt = s.nextLine();
                if (inputAppt == "E") {           // close db connection and exit
                    con.close();
                    return;
                } else if (inputAppt == "D") {  // return to choose date
                    break;  // break out from while loop for choose appointments, get back to choose date
                }
                int idx = s.nextInt();

                // step 4: ask for action
                Appointment appt = appointments.get(idx);
                String mname = appt.getMname();
                String mramq = appt.getMramq();
                int choice = displayOptions(mname, mramq);
                while (choice > 0) {
                    switch (choice) {
                        case 1:
                            reviewNotes(appt);
                            choice = displayOptions(mname, mramq);
                            break;
                        case 2:
                            reviewTests(appt);
                            choice =  displayOptions(mname, mramq);
                            break;
                        case 3:
                            addNote();
                            choice = displayOptions(mname, mramq);
                            break;
                        case 4:
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


    static String isValidPID(Connection con, String pid) throws SQLException {
        String querySQL = "SELECT id FROM midwives WHERE pid = " + pid;
        Statement statement = con.createStatement();
        java.sql.ResultSet rs = statement.executeQuery(querySQL);
        String validPID = rs.getString("PID");
        rs.close();
        // TODO can validPID be null?
        statement.close();
        return validPID;
    }

    static ArrayList<Appointment> getAppointments(String date) {
        ArrayList<Appointment> appts = null;
        return appts;
    }

    static void displayAppointments(ArrayList<Appointment> appts) {
        for (Appointment app : appts) {
            // TODO
        }
    }

    // TODO Mother?
    // display all options for the current Mother, return the option number
    static int displayOptions(String name, String ramq) {
        System.out.println(
                "For" + name + ramq + "\n\n" +
                        "1. Review notes\n" +
                        "2. Review tests\n" +
                        "3. Add a note\n" +
                        "4. Prescribe a test\n" +
                        "5. Go back to the appointments.\n\n" +
                        "Enter your choice:");
        Scanner s = new Scanner(System.in);
        return s.nextInt();
    }


    // list all the notes relevant for this pregnancy in the descending order of date time,
    // even if they are not from the selected appointment
    // the output should be date-time and no more than the first 50 characters of each note(s).
    // e.g. 2022-02-13 10:02:45  Baby has good movements
    static void reviewNotes(Appointment prg) {
        // TODO
    }

    // list all the tests relevant for this pregnancy (but only the tests relevant for the mother)
    // in the descending order of date (test prescription), the output should be date (test prescription),
    // test type and no more than the first 50 characters of each result(s).
    // (put square brackets in output display to separate from the type of test and the text for results)
    // If a result is not yet available, display the text PENDING in it’s place.
    // e.g. 2022-02-01 [blood iron] A bit low, recommended supplements.
    static void reviewTests(Appointment prg) {
        // TODO
    }

    // let the user type in a text (note) that is then stored into the system
    // use the current date and time
    static void addNote() {
        System.out.println("Please type your observation:");
        Scanner s = new Scanner(System.in);
        String msg = s.nextLine();
        // TODO
    }

    // let the user enter the type of test that is being prescribed and that will be recorded in the system.
    // assume that test is for the mother
    // prescription date and sample date of the test is the date on which the test prescription is being entered
    // use the current date and time
    static void prescribeTest() {
        System.out.println("Please enter the type of test:");
        Scanner s = new Scanner(System.in);
        String msg = s.nextLine();
        // TODO

    }
}
