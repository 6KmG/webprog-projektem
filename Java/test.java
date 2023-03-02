import static java.lang.System.*;
import java.util.*;

class test{
    public static void main(String args[])
    {
Scanner input = new Scanner(in);
Random rand = new Random();
LinkedList<String> mylist = new LinkedList<>();
String mytext = input.next();

mylist.add(mytext);

out.println(mylist.get(0));

    }
}