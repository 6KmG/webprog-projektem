package com.snakegame;

import java.awt.Color;
import java.awt.Graphics;

public class Circle {
    public Circle(Graphics g, int x, int y, int radius, Color color) {
        g.setColor(color);
        g.fillOval(x, y, radius, radius);
    }
}
