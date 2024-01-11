package com.snakegame;

import static java.lang.System.out;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.Timer;

public class Frame extends JFrame{
    static int fps = 0;
    public static String title = "Snake game in Java Swing | Score: ";
    static Timer timer = new Timer(Updater.DELAY, new Updater());
    
    public Frame(){
        this.addKeyListener(new Input());
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(Updater.WIDTH, Updater.HEIGHT);
        this.setTitle(title);
        this.add(Updater.panel);

        timer.start(); // Start the timer   
        this.setVisible(true);
    }

    static void gameOver(Frame frame){
        timer.stop();
        JOptionPane.showMessageDialog(
            frame,
            "Your score: " + Head.score,
            "Game Over!",
            JOptionPane.INFORMATION_MESSAGE
        );
        System.exit(0);
    }
}
