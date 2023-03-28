package javawindow.src;

import javax.swing.JPanel;

import java.awt.Color;
import java.awt.Graphics;


public class Panel extends JPanel{
    public int x = 25;
    public int y = 25;
    public static final int FPS = 60;

    public void paintComponent(Graphics g){
        super.paintComponent(g);
        this.setBackground(Color.CYAN);
        Graphics rect = (Graphics) g;
        rect.drawRect(x, y, 50, 50);
        rect.fillRect(x, y, 50, 50);
        rect.setColor(Color.BLUE);
        
    }

}
