package com.snakegame;

import java.awt.Color;

public class Head{
    public static final Color COLOR = Color.WHITE;
    static final int SPEED = 720;
    static final int TURNCOOLDOWN = 8;
    static final int SNAKELENGTH = 1000000;
    static final int STARTINGLENGTH = 10;

    static int x = 0;
    static int y = 0;
    static int width = 30;
    static int height = 30;
    static int score = 0;
    static int turnCounter = 0;

    public static int snakeCoords[][] = new int[SNAKELENGTH][2];

    protected static int[] direction = {0, 0, -1, 1}; // W, S, A, D, in that order

    public static boolean collides(int x, int y, int width, int height){
        if(
            Head.x + Head.width > x && 
            Head.y + Head.height > y &&
            Head.x < x + width &&
            Head.y < y + height
        ){
            return true;
        }
        else return false;
    }
}
