package javawindow.src;

public class App{
    static Frame myframe = new Frame();
    static Panel mypanel = new Panel();
    public static void main(String[] args) throws Exception {
        while(true){
            myframe.add(mypanel);
        }
        
    }
}
