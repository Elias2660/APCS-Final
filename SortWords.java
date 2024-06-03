import java.io.File;
import java.util.Scanner;
import java.io.IOException;
import java.util.ArrayList;
import java.io.FileWriter;

public class SortWords {

    public static void main(String[] args) {
        CreateFiveLettersWordList();
    }

    public static ArrayList<String> getWords() {
        ArrayList<String> wList = new ArrayList<String>();
        try {

            CreateFiveLettersWordList();
            Scanner f = new Scanner(new File("Fivers.txt"));
            while (f.hasNextLine()) {
                wList.add(f.nextLine().strip().toLowerCase());
            }
            f.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wList;
    }


    public static void CreateFiveLettersWordList() {
        try {
            File fiveLetterWords = new File("Fivers.txt");
            if (fiveLetterWords.createNewFile()) {
                System.out.println("Created new file");
            }
        } catch (IOException E) {
            E.printStackTrace();
        }

        ArrayList<String> fiveLetterers = new ArrayList<String>();
        try {
            Scanner words = new Scanner(new File("words.txt"));
            while (words.hasNextLine()) {
                String word = words.nextLine();
                if (word.length() == 5 && isAlpha(word)) {
                    fiveLetterers.add(word);
                }
            }
            words.close();
            System.out.println("Got all the letters");
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FileWriter fLettersFile = new FileWriter("Fivers.txt");
            for (String word: fiveLetterers) {
                fLettersFile.write(word +"\n");
            }
            System.out.println("Written all the letters, length " + fiveLetterers.size());
            fLettersFile.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 

    public static boolean isAlpha(String name) {
        return name.matches("[a-zA-Z]+");
    }
    
}
