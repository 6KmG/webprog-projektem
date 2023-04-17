package test.mypackage;

import static java.lang.System.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.swing.*;

public class Frame extends JFrame{
    Frame(){
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setTitle("mytitle");
        this.setSize(500,500);
        this.setLayout(new GridLayout(5, 1, 200, 30));

        JTextField field1 = new JTextField("szoveg");
        JTextField field2 = new JTextField("szoveg");
        JButton button1 = new JButton("Check");

        this.add(field1);
        this.add(field2);
        this.add(button1);
        this.pack();
        this.setVisible(true);
        button1.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        if(field1.getText().equals(field2.getText())){
                            field1.setBackground(Color.GREEN);
                            field2.setBackground(Color.GREEN);
                        }
                        else{
                            field1.setBackground(Color.RED);
                            field2.setBackground(Color.RED);
                        }
                    }
                }
        );


    }
}
