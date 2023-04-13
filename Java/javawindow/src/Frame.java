// package javawindow.src;

import javax.swing.*;

public class Frame extends JFrame{
    Frame(){
        Panel panel = new Panel();
        this.add(panel);

        this.setTitle(Panel.title);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);
        this.pack();
        this.setVisible(true);
    }
    public void changeTitle(String title){
        this.setTitle(title);
    }
}
