package test.mypackage;

import static java.lang.System.*;
public class App {
    public static void main(String[] args){
        Decide myfunc = new Decide() {
            @Override
            public boolean isEven(int x) {
                return x % 2 == 0;
            }
        };
        out.println(myfunc.isEven(2));
    }
}
