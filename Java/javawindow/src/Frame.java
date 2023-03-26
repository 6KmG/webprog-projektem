package javawindow.src;

import java.awt.event.*;

import javax.swing.*;

public class Frame extends JFrame implements KeyListener{
    static int x;
    Frame(){
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(500, 500);
        this.setVisible(true);
        this.setTitle("Mytitle");
        this.addKeyListener(this);
    }


    @Override
    public void keyTyped(KeyEvent e) {

    }

    @Override
    public void keyPressed(KeyEvent e) {

    }

    @Override
    public void keyReleased(KeyEvent e) {
        if(e.getKeyChar() == 'd'){
            App.mypanel.y += 10;
            System.out.println(App.mypanel.y);
        }
    }
    
}
