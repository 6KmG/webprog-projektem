package javawindow.src;

import static java.lang.System.*;
import java.util.Random;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class App implements ActionListener{
    int count = 0;

    JFrame frame = new JFrame();
    JPanel panel = new JPanel();
    JLabel label1 = new JLabel("Password Generator");
    JButton button1 = new JButton("Click");
    JTextField textbox1 = new JTextField("asd");

    public App(){
        button1.addActionListener(this);

        panel.setBorder(BorderFactory.createEmptyBorder(30, 30, 10, 30));
        panel.setLayout(new GridLayout(5,1));

        panel.add(label1);
        panel.add(button1);
        panel.add(textbox1);

        frame.add(panel, BorderLayout.CENTER);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("hi");
        frame.pack();
        frame.setVisible(true);
    }
    public static void main(String[] args) throws Exception {
        new App();
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        count++;
        textbox1.setText(generateText(8));
        out.println("asd");
        throw new UnsupportedOperationException("Unimplemented method 'actionPerformed'");
    }
    public String generateText(int length){
        Random rand = new Random();
        String password = "";
        int tmp;
        for(int i = 0; i < length; i++){
            tmp = rand.nextInt(128 - 33) + 33;
            password += (char)tmp;
        }
        return password;
    }
}
