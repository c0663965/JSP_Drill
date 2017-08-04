/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypkg;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author khlee
 */
public class FileHandler {

    public static List<List<Integer>> hitNumbers;
    public static List<List<Integer>> jackPotNumbers = new ArrayList();
    public static int r,c;
    public static String fName="C:\\Users\\khlee\\OneDrive\\Documents\\NetBeansProjects\\WebApplication7_1\\src\\java\\data2.txt";
            
    public FileHandler() throws FileNotFoundException {
        hitNumbers=fileDataToArray(fName);
    }

    public static List<List<Integer>> getHitNumber() {
        return hitNumbers;
    }

    public static List<List<Integer>> getJackPotNumbers() {
        return jackPotNumbers;
    }
  
    public static List<List<Integer>> jackPot(List<String> in, List<String> ex, int n){

            Random rn = new Random();

            List<List<Integer>> thisWeek = new ArrayList();
            List<Integer> excluded = new ArrayList();

            in.forEach((v) -> {
                excluded.add(Integer.parseInt(v));
        });
            
            ex.forEach((v) -> {
                excluded.add(Integer.parseInt(v));
        });

            int rnd;
            boolean isContained, isTheSame = false;

            while (thisWeek.size() < n) {
         
                List<Integer> gns = new ArrayList();
         
                while (gns.size() < (6-in.size())) {
                    rnd = 1 + rn.nextInt(45 - 1 + 1);
                    isContained = excluded.contains(rnd) || gns.contains(rnd);
                    if (!isContained) 
                        gns.add(rnd);
                }
                
                in.stream().filter((v) -> (!"-1".equals(v))).forEachOrdered((v) -> {
                    gns.add(Integer.parseInt(v));
                });

                Collections.sort(gns);
                
                for (List<Integer> e : hitNumbers) {
                    if (e.equals(gns)) {
                        isTheSame = true;
                        break;
                    }
                }
                thisWeek.add(gns);
            } 
        return thisWeek;
    }
    
    public static List<List<Integer>> fileDataToArray(String fName) throws FileNotFoundException {

        File file = new File(fName);
        
        List<List<Integer>> data;
       
        try (Scanner inputStream = new Scanner(file)) {
            
            data = new ArrayList();
        
            while (inputStream.hasNext()) {
                
                List<Integer> temp = new ArrayList();
                
                String line = inputStream.next();
                String[] values = line.split(",");
                
                for (String e:values)
                    temp.add(Integer.parseInt(e));
                
                data.add(temp);
            }
        }
     
        return data;
    }
}  
