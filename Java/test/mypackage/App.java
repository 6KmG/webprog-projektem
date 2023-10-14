import static java.lang.System.*;

import java.util.Calendar;
import java.util.Date;

public class App {
    public static void main(String[] args){
        Date birth = new Date(2003 - 1900, Calendar.JANUARY, 1);
        System.out.print(birth);
    }
}
