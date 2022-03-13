package project.p3;

public class Appointment {
    String apptime;
    String mwrole;
    String mramq;
    String mname;
    Pregnancy prg;

    public Pregnancy getPrg() {
        return prg;
    }

    public String getMramq() {
        return mramq;
    }

    public void setMramq(String mramq) {
        this.mramq = mramq;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public void setPrg(Pregnancy prg) {
        this.prg = prg;
    }

    public String getMname() {
        return mname;
    }

    public void setApptime(String apptime) {
        this.apptime = apptime;
    }

    public void setMwrole(String mwrole) {
        this.mwrole = mwrole;
    }

    public String getApptime() {
        return apptime;
    }

    public String getMwrole() {
        return mwrole;
    }
}
