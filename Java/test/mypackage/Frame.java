package test.mypackage;

import static java.lang.System.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;

public class Frame extends JFrame{
    Frame(){
        String fileContent = "<html>";

        String filePath = "E:/pcs/Java/test/mypackage/App.java";
        try {
            fileContent += new String(Files.readAllBytes(Paths.get(filePath)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        fileContent = fileContent.replaceAll("\n", "<br>");
        fileContent += "</html>";

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setTitle("mytitle");
        setSize(500,500);
        JLabel mylabel = new JLabel(fileContent);
        setLayout(new GridLayout(5, 3, 200, 30)); 
        add(mylabel);
        

        setVisible(true);
        
    }
}
