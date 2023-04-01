// Készítsen programot, amely a main metódusban, 
// egymás után bekéri több téglatest három méretét (tetszőleges végjelig). 
// Metódus segítségével számítsa ki a téglatestek térfogatát 
// (a metódus paraméterei a három méret, a visszaadott érték a térfogat). 
// A téglatestek méreteit és  a  térfogatát  a  main  kiírja  egy  random  állományba.  
// A  fájlból  minden  harmadik  sort olvasson ki és írja azt a képernyőre. 

package Feladat1.src;

import static java.lang.System.*;
import java.util.*;
import java.io.*;


public class App {
    public static void main(String[] args) {
        // CheckHeight myHeight = new CheckHeight();

        // myHeight.input();
        // myHeight.output();

        // InheritHeight myHeight2 = new InheritHeight(177);

        // myHeight2.input();
        // myHeight2.output();



        // Scanner input = new Scanner(in);

        // List<String> mylist = new ArrayList<>();
        // try {
        //     String temp;
        //     while(true){
        //         temp = input.next();
        //         if(mylist.contains(temp)) throw new Exception();
        //         mylist.add(temp);
        //     }
        // } catch (Exception error) {
        //     out.println("már van benne");
        // }
        // finally{
        //     input.close();
        // }



        // Scanner input = new Scanner(in);

        // float a, b, c;

        // out.println("Kérem az első paramétert: "); a = input.nextFloat();
        // out.println("Kérem az második paramétert: "); b = input.nextFloat();
        // out.println("Kérem az harmadik paramétert: "); c = input.nextFloat();

        // File myFile = new File("mytext.txt");

        // CuboidCalc.writeCuboid(myFile, a, b, c, CuboidCalc.cuboid(a, b, c));

        // input.close();

        Scanner input = new Scanner(in);

        float a, b, c;

        try {
            RandomAccessFile myfile = new RandomAccessFile("mybin.bin", "rw");

            while(true){
                a = input.nextFloat(); if(a <= 0) break;
                b = input.nextFloat(); if(b <= 0) break;
                c = input.nextFloat(); if(c <= 0) break;

                myfile.writeFloat(a);
                myfile.writeFloat(b);
                myfile.writeFloat(c);
                myfile.writeFloat(CuboidCalc.cuboid(a, b, c));
            }

            int i = Float.BYTES * 2;
            float mynum = 0;
            out.println("-----------------------------");
            while(i < myfile.length()){
                myfile.seek(i);

                mynum = myfile.readFloat();
                out.println(mynum);
                i += (Float.BYTES * 3);
            }

            i = 0;
            mynum = 0;
            out.println("-----------------------------");
            while(i < myfile.length()){
                myfile.seek(i);

                mynum = myfile.readFloat();
                out.println(mynum);
                i += (Float.BYTES);
            }

        } catch (Exception e) {
            err.println(e);
        }
        finally{
            input.close();
        }
        
    }
}

class CheckHeight{
    float height, average;

    public void input(){
        Scanner input = new Scanner(in);

        out.print("Kérem a testmagasságot: "); height = input.nextFloat();
        out.print("Kérem az átlag magasságot: "); average = input.nextFloat();

        input.close();
    }

    public void output(){
        if(height < average) out.println("A testmagassága az átlag alatt van.");
        else out.println("A magassága az átlag felett van vagy pont annyi.");
    }
}

class InheritHeight extends CheckHeight{

    InheritHeight(float average){
        super.average = average;
    }
    
    public void input(){
        Scanner input = new Scanner(in);

        out.print("Kérem a testmagasságot: "); height = input.nextFloat();

        input.close();
    }
}

class CuboidCalc{
    public static float cuboid(float a, float b, float c){
        return a * b * c;
    }

    public static void writeCuboid(File file, float a, float b, float c, float result){
        try {
            FileWriter myFileWrite = new FileWriter(file);
            
            myFileWrite.write(a + "; " + b + "; " + c + " -> " + cuboid(a, b, c));
    
            myFileWrite.close();

        } catch (IOException error) {
            err.println(error);
        }
    }
}
