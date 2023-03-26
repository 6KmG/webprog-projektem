package javawindow.src;

import javax.swing.JPanel;

import java.awt.Color;
import java.awt.Graphics;

public class Panel extends JPanel{
    public static int x = 25;
    public static int y = 25;
    public void paint(Graphics g){
        super.paint(g);
        this.setBackground(Color.WHITE);
        g.drawRect(x, y, 50, 50);
        g.fillRect(x, y, 50, 50);
        g.setColor(Color.BLUE);
        
    }
}
