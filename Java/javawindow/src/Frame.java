package javawindow.src;

import javax.swing.*;

public class Frame extends JFrame{
    Frame(){
        Panel panel = new Panel();
        this.add(panel);

        this.setTitle("mytitle");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);
        this.pack();
        this.setVisible(true);
        this.setLocation(null);
    }
}
