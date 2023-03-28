package javawindow.src;

public class App{
    static Frame myframe = new Frame();
    static Panel mypanel = new Panel();
    public static void main(String[] args) throws Exception {
        myframe.add(mypanel);
        while (true){
            if(App.mypanel.x < 500) App.mypanel.x++;
            else App.mypanel.x--;
            myframe.repaint();
        }
        
    }
}
