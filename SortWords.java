import java.io.File;
import java.util.Scanner;
import java.io.IOException;
import java.util.ArrayList;
import java.io.FileWriter;

/**
 * The SortWords class provides methods to create and manipulate lists of five-letter words.
 */
public class SortWords {

    private static String BASEPATH = "/Users/eliasxu/Documents/Projects/apcsa-assignments-Elias2660/main/";

    /**
     * The main function calls the CreateFiveLettersWordList method.
     */
    public static void main(String[] args) {
        CreateFiveLettersWordList();
    }

    /**
     * The function `getWords()` reads a list of five-letter words from a file, converts them to
     * lowercase, and returns them in an ArrayList.
     * 
     * @return An ArrayList of Strings containing words read from a file named "Fivers.txt" after
     * converting them to lowercase and removing any leading or trailing whitespace.
     */
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

    /**
     * The function `CreateFiveLettersWordList` creates a list of five-letter words from a file and
     * saves them to a new file named "Fivers.txt".
     */
    public static void CreateFiveLettersWordList() {
        try {
            File fiveLetterWords = new File("Fivers.txt");
            if (fiveLetterWords.createNewFile()) {
            }
        } catch (IOException E) {
            E.printStackTrace();
        }

        ArrayList<String> fiveLetterers = new ArrayList<String>();
        try {
            Scanner words = new Scanner(new File(BASEPATH + "words.txt"));
            while (words.hasNextLine()) {
                String word = words.nextLine();
                if (word.length() == 5 && isAlpha(word)) {
                    fiveLetterers.add(word);
                }
            }
            words.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FileWriter fLettersFile = new FileWriter(BASEPATH + "Fivers.txt");
            for (String word : fiveLetterers) {
                fLettersFile.write(word + "\n");
            }
            fLettersFile.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * The function `createAnswerWordList` reads a file containing common words, filters out
     * non-alphabetic words and words not of length 5, and returns an ArrayList of valid words.
     * 
     * @return The method `createAnswerWordList` returns an ArrayList of Strings containing words that
     * are 5 characters long and consist only of alphabetic characters.
     */
    public static ArrayList<String> createAnswerWordList() {
        ArrayList<String> PossibleAnswers = new ArrayList<String>();
        try {
            Scanner words = new Scanner(new File("/Users/eliasxu/Documents/Projects/apcsa-assignments-Elias2660/main/tenThousandCommon.txt"));
            while (words.hasNextLine()) {
                String line = words.nextLine();
                if (isAlpha(line) && line.length() == 5) {
                    PossibleAnswers.add(line);
                }
            }
            words.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return PossibleAnswers;
    }

    /**
     * The function isAlpha checks if a given string contains only alphabetic characters.
     * 
     * @param name The `isAlpha` method checks if the input `name` consists only of alphabetic
     * characters (both uppercase and lowercase).
     * @return The method isAlpha takes a String input and returns a boolean value. It checks if the
     * input string contains only alphabetic characters (both uppercase and lowercase) using a regular
     * expression pattern "[a-zA-Z]+". If the input string contains only alphabetic characters, the
     * method returns true; otherwise, it returns false.
     */
    public static boolean isAlpha(String name) {
        return name.matches("[a-zA-Z]+");
    }

}
