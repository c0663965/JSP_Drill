/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypkg;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author khlee
 */
public class NewClass {

    public static List<List<String>> hitNumbers;
    public static List<List<String>> jackPotNumbers = new ArrayList();
    public static int r,c;
    public static String fName="C:\\Users\\khlee\\OneDrive\\Documents\\NetBeansProjects\\WebApplication7_1\\src\\java\\data2.txt";
            
    public NewClass() throws FileNotFoundException {
        hitNumbers=fileDataToArray(fName);
    }

    public static List<List<String>> getHitNumber() {
        return hitNumbers;
    }

   
   
    public static List<List<String>> fileDataToArray(String fName) throws FileNotFoundException {

        File file = new File(fName);
        
        List<List<String>> data;
       
        try (Scanner inputStream = new Scanner(file)) {
            
            data = new ArrayList();
        
            while (inputStream.hasNext()) {
                
                
                String line = inputStream.next();
                String[] values = line.split(",");
                
                data.add(Arrays.asList(values));
            }
        }
     
        return data;
    }
}  
