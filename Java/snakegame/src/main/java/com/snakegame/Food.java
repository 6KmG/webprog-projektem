package com.snakegame;

import java.awt.Color;

public class Food{
    static int radius = 40;

    static int x = (int) (Math.random() * (Updater.WIDTH - radius));
    static int y = (int) (Math.random() * (Updater.HEIGHT - radius));

    public static final Color COLOR = Color.WHITE;
}
