package src;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {
    public static void main(String[] args) {
//        long millis=System.currentTimeMillis();
//        java.sql.Date date = new java.sql.Date(millis);



        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(formatter.format(date));
        formatter = new SimpleDateFormat("HH:mm:ss");
        System.out.println(formatter.format(date));


    }
}
