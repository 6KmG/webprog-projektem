// package javawindow.src;

import static java.lang.System.*;

import java.util.Arrays;
import java.util.Random;

import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.Timer;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class Panel extends JPanel implements ActionListener{
    final static int WIDTH = 800;
    final static int HEIGHT = 600;
    final static int FPS = 77;
    final static int FRAMESPEED = 1000 / FPS;
    final static int SPEED = 700;
    final static double DELAY = 0.125;
    final static int SNAKE_SIZE = 30;
    final static int CIRCLE_SIZE = 50;
    final static int MAX_SNAKE_LEN = 100000;

    Random rand = new Random();
    Timer timer;

    int x = 0;
    int y = 0;
    int circleX = rand.nextInt(WIDTH - CIRCLE_SIZE);
    int circleY = rand.nextInt(HEIGHT - CIRCLE_SIZE);
    int score = 0;
    
    char key = 'd';
    double cooldown = 0;

    static int count = (FPS/14)*6+3;
    public static int i = 0;
    public static boolean running = false;
    public static int start;
    int direction[] = {0, 0, 2, 1}; // W, S, A, D
    int[] snakeLen = new int[MAX_SNAKE_LEN];

    private double myNanoTime(){
        return nanoTime() / 1_000_000_000.0;
    }

    Panel(){
        this.setPreferredSize(new Dimension(WIDTH, HEIGHT));
        this.setBackground(new Color(83,130,161));
        this.setFocusable(true);
        this.addKeyListener(new MyKeyAdapter());
        start();
    }

    public void start(){
        Arrays.fill(snakeLen, -100);
        running = true;
        timer = new Timer(FRAMESPEED, this);
        timer.start();
    }

    public void paintComponent(Graphics g){
        super.paintComponent(g);
        drawRect(g);
        drawCircle(g);
        drawBody(g);
    }

    public void drawRect(Graphics g){
        g.setColor(Color.white);
        g.fillRect(x, y, SNAKE_SIZE, SNAKE_SIZE);
    }

    public void drawBody(Graphics g){
        if(i < FPS/2){
            snakeLen[i] = x;
            snakeLen[i+1] = y;
            i+=2;
        }
        else{
            snakeLen[0] = x;
            snakeLen[1] = y;
            for (int j = count; j>2; j-=2){
                snakeLen[j] = snakeLen[j-2];
                snakeLen[j-1] = snakeLen[j-3];
            }
            g.setColor(Color.white);
            g.fillRect(snakeLen[(int)(FPS/14)*2], snakeLen[(int)(FPS/14)*2+1], SNAKE_SIZE, SNAKE_SIZE);
            g.fillRect(snakeLen[(int)(FPS/14)*4], snakeLen[(int)(FPS/14)*4+1], SNAKE_SIZE, SNAKE_SIZE);
            g.fillRect(snakeLen[(int)(FPS/14)*6], snakeLen[(int)(FPS/14)*6+1], SNAKE_SIZE, SNAKE_SIZE);
        }

        // dangerous
        int incrementation = (FPS/14) * 2;
        for(start = ((int)(FPS/14)*2)*4+2; start < count; start += incrementation){
            g.fillRect(snakeLen[start], snakeLen[start+1], SNAKE_SIZE, SNAKE_SIZE);
            if (x > snakeLen[start] && y > snakeLen[start+1] && x < snakeLen[start] + SNAKE_SIZE && y < snakeLen[start+1] + SNAKE_SIZE){
                running = false;
            }
        }

        if (x + SNAKE_SIZE > circleX && y + SNAKE_SIZE > circleY && x < circleX + CIRCLE_SIZE && y < circleY + CIRCLE_SIZE){
            circleX = rand.nextInt(WIDTH - CIRCLE_SIZE);
            circleY = rand.nextInt(HEIGHT - CIRCLE_SIZE);
            count+=(FPS/14)*2;
            score++;
        }
    }

    public void drawCircle(Graphics g){
        g.setColor(new Color(255,143,0));
        g.fillOval(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
    }

    public void move(){
        if(direction[0] == 1) y-= Math.round(SPEED / FPS);  // W
        if(direction[1] == 1) y+= Math.round(SPEED / FPS);  // S
        if(direction[2] == 1) x-= Math.round(SPEED / FPS);  // A
        if(direction[3] == 1) x+= Math.round(SPEED / FPS);  // D
    }

    public void checkBorder(){
        if(x < 0 - SNAKE_SIZE) running = false;
        if(y < 0 - SNAKE_SIZE) running = false;
        if(x > WIDTH) running = false;
        if(y > HEIGHT) running = false;
    }

    public void keyControl(){
        if((key == 'd' || key == 'D') && direction[3] != 2 && myNanoTime() > cooldown){
            direction[0] = 0;
            direction[1] = 0;
            direction[2] = 2;
            direction[3] = 1;
            cooldown = myNanoTime() + DELAY;
        }
        if((key == 'a' || key == 'A') && direction[2] != 2 && myNanoTime() > cooldown){
            direction[0] = 0;
            direction[1] = 0;
            direction[2] = 1;
            direction[3] = 2;
            cooldown = myNanoTime() + DELAY;
        }
        if((key == 'w' || key == 'W') && direction[0] != 2 && myNanoTime() > cooldown){
            direction[0] = 1;
            direction[1] = 2;
            direction[2] = 0;
            direction[3] = 0;
            cooldown = myNanoTime() + DELAY;
        }
        if((key == 's' || key == 'S') && direction[1] != 2 && myNanoTime() > cooldown){
            direction[0] = 2;
            direction[1] = 1;
            direction[2] = 0;
            direction[3] = 0;
            cooldown = myNanoTime() + DELAY;
        }
    }

    public class MyKeyAdapter extends KeyAdapter{
        public void keyPressed(KeyEvent e){
            key = e.getKeyChar();
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(running){
            move();
            repaint();
            checkBorder();
            keyControl();
        }
        else{
            JOptionPane.showMessageDialog(null, "Your score: "+score, "Score", 1);
            System.exit(0);
        }
    }
}
