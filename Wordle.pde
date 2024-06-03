import java.util.Arrays;
public class Wordle {
    private Patch[] patches;
    private PApplet papplet;
    private int currentRow = 0;
    private boolean letterPressed = false;
    private boolean codedPressed = false;
    ArrayList<String> words = SortWords.getWords();
    // the current row
    private char[] currentRow = new char[]{'','','','',''};
    private int numberOfLettersInCurrentRow = 0;

    // the ANSWEr
    private String answer;
    
    public Wordle(PApplet papplet) {
        this.papplet = papplet;
        papplet.background(color(18,18,19));
        // 5 x 6 board
        // so with each path being 30 x 30
        int PATCH_WIDTH = 80;
        int PATCH_HEIGHT = 80;
        int BORDER_WIDTH = 10;
        int WIDTH = PATCH_WIDTH * 5 + BORDER_WIDTH * 6;
        int HEIGHT = PATCH_HEIGHT * 6 + BORDER_WIDTH * 7;
        
        
        windowResize(WIDTH, HEIGHT);
        patches = new Patch[30];
        int index = 0;
        
        for (int h = BORDER_WIDTH; h + PATCH_HEIGHT + BORDER_WIDTH <= HEIGHT; h += PATCH_HEIGHT + BORDER_WIDTH) {
            for (int w = BORDER_WIDTH; w + PATCH_WIDTH + BORDER_WIDTH <= WIDTH; w += PATCH_WIDTH + BORDER_WIDTH) {
                System.out.println("w: " + w + " h: " + h);
                Patch p = new Patch(papplet, w, h, PATCH_WIDTH, PATCH_HEIGHT, color(18,18,19), 0.0, true);
                patches[index] = p;
                index++;
            }
        }


        // set random word to be the word of choice
        answer = words.get((int) random(0, words.size()));
    }
    
    public void draw() {
        for (int i = 0; i < 30;  i ++) {
            patches[i].draw();
        }

        if (keyPressed && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z') || (key == CODED && (keyCode == ENTER || keycode == DELETE)) )) {
            if  ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
                letterPressed = true;
                codedPressed = false;
            } else if (key == CODED && keyCode == ENTER) {
                codedPressed = true;
                letterPressed = false;
            }
        } else if (!keyPressed && (letterPressed) && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z'))) {
            if (numberOfLettersInCurrentRow < 5) {
                currentRow[numberOfLettersInCurrentRow] = Character.toUpperCase(key);
                numberOfLettersInCurrentRow++;
            }
        } else if (!keyPressed && (key == CODED && (keyCode == ENTER || keycode == DELETE))) {
            if (keybode == ENTER) {
                // use the random word generator to check if the word is valid

            }
        }

        // keypresses
        
    }
    
    private boolean isWordValid(String word) {
        return true;
    }
    
    private String CharArrayToWord(char[]  word) {
        String str = "";
        for (char c : word) {
            str += c;
        }
        return str;
    }
    
    private char[] WordToCharArray(String word) {
        return word.toCharArray();
    }
}