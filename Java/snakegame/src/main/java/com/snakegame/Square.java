package com.snakegame;

import java.awt.Color;
import java.awt.Graphics;

public class Square {
    public Square(Graphics g, int x, int y, int width, int height, Color color) {
        g.setColor(color);
        g.fillRect(x, y, width, height);
    }

}
