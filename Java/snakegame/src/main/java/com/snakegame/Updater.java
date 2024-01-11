package com.snakegame;

import static java.lang.System.currentTimeMillis;
import static java.lang.System.out;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Updater implements ActionListener{
    static Panel panel = new Panel();

    static final int FPS = 60;
    static final int DELAY = 1000 / FPS;

    static final float ACTUALSPEED = Head.SPEED * DELAY / 1000;
    public static final int WIDTH = 960;
    public static final int HEIGHT = 540;

    public static int fpsCounter = 0;
    public int i = 0;

    @Override
    public void actionPerformed(ActionEvent e) {
        if(Head.direction[0] == 1){
            Head.y -= ACTUALSPEED;
        }
        if(Head.direction[1] == 1){
            Head.y += ACTUALSPEED;
        }
        if(Head.direction[2] == 1){
            Head.x -= ACTUALSPEED;
        }
        if(Head.direction[3] == 1){
            Head.x += ACTUALSPEED;
        }

        if(Head.collides(Food.x, Food.y, Food.radius, Food.radius) == true){
            Food.x = (int) (Math.random() * (WIDTH - Food.radius));
            Food.y = (int) (Math.random() * (HEIGHT - Food.radius));
            Head.score++;
        }

        if(Head.collides(-Head.width, 0, 0, HEIGHT)){ // Hitting left wall
            Frame.gameOver(Main.frame);
        }
        if(Head.collides(Head.width + WIDTH, 0, 0, HEIGHT)){ // Hitting right wall
            Frame.gameOver(Main.frame);
        }
        if(Head.collides(0, -Head.height, WIDTH, 0)){ // Hitting top wall
            Frame.gameOver(Main.frame);
        }
        if(Head.collides(0, HEIGHT + Head.height, WIDTH, HEIGHT)){ // Hitting bottom wall
            Frame.gameOver(Main.frame);
        }

        if(fpsCounter < Head.SNAKELENGTH){
            Head.snakeCoords[fpsCounter][0] = Head.x;
            Head.snakeCoords[fpsCounter][1] = Head.y;
        }
        
        if(fpsCounter > FPS){
            for(int i = -Head.STARTINGLENGTH; i < Head.score; i++){
                if(Head.collides(Head.snakeCoords[Updater.fpsCounter - 1 - ((Head.score - i) * (Updater.FPS / 15))][0], Head.snakeCoords[Updater.fpsCounter - 1 - ((Head.score - i) * (Updater.FPS / 15))][1], Head.width, Head.height)){
                    Frame.gameOver(Main.frame);
                }
            }
        }

        Main.frame.setTitle(Frame.title + Head.score);
        Head.turnCounter++;
        fpsCounter++;
        panel.repaint();
    }
}
