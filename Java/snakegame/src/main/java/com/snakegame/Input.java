package com.snakegame;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class Input extends KeyAdapter{
    @Override
    public void keyPressed(KeyEvent e) {
        // Check if Enter key is pressed
        if (
            e.getKeyCode() == KeyEvent.VK_W && 
            Head.direction[0] != -1 && 
            Head.turnCounter > Head.TURNCOOLDOWN
        ) {
            Head.turnCounter = 0;
            Head.direction[0] = 1;
            Head.direction[1] = -1;
            Head.direction[2] = 0;
            Head.direction[3] = 0;
        }

        if (
            e.getKeyCode() == KeyEvent.VK_S && 
            Head.direction[1] != -1 && 
            Head.turnCounter > Head.TURNCOOLDOWN
        ) {
            Head.turnCounter = 0;
            Head.direction[0] = -1;
            Head.direction[1] = 1;
            Head.direction[2] = 0;
            Head.direction[3] = 0;
        }

        if (
            e.getKeyCode() == KeyEvent.VK_A && 
            Head.direction[2] != -1 && 
            Head.turnCounter > Head.TURNCOOLDOWN
        ) {
            Head.turnCounter = 0;
            Head.direction[0] = 0;
            Head.direction[1] = 0;
            Head.direction[2] = 1;
            Head.direction[3] = -1;
        }

        if (
            e.getKeyCode() == KeyEvent.VK_D && 
            Head.direction[3] != -1 && 
            Head.turnCounter > Head.TURNCOOLDOWN
        ) {
            Head.turnCounter = 0;
            Head.direction[0] = 0;
            Head.direction[1] = 0;
            Head.direction[2] = -1;
            Head.direction[3] = 1;
        }
    }
}
