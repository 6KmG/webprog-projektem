package com.snakegame;

import javax.swing.JPanel;

import java.awt.Color;
import java.awt.Graphics;

public class Panel extends JPanel{
    public final Color BACKGROUND_COLOR = new Color(150, 150, 255);
    public static int i = 0;

    public Panel(){
        this.setBackground(BACKGROUND_COLOR);
    }

    @Override
    protected void paintComponent(Graphics g){
        super.paintComponent(g);
        new Square(g, Head.x, Head.y, Head.width, Head.height, Head.COLOR);

        new Circle(g, Food.x, Food.y, Food.radius, Head.COLOR);

        for(int i = -Head.STARTINGLENGTH; i < Head.score; i++){
            new Square(g, Head.snakeCoords[Updater.fpsCounter - 1 - ((Head.score - i) * (Updater.FPS / 15))][0], Head.snakeCoords[Updater.fpsCounter - 1 - ((Head.score - i) * (Updater.FPS / 15))][1], Head.width, Head.height, Head.COLOR);
        }
    }
}
