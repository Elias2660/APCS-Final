import java.util.Arrays;
public class Wordle {
    private Patch[] patches;
    private PApplet papplet;
    private boolean letterPressed = false;
    private boolean codedPressed = false;
    ArrayList<String> words;
    // the current row
    private char[] currentRowLetters = new char[]{' ',' ',' ',' ',' '};
    private int currentRow = 0;
    private int numberOfLettersInCurrentRow = 0;
    
    color GREEN = color(0, 255, 0);
    color YELLOW = color(255, 255, 0);
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
        words = SortWords.getWords();
        System.out.println(words.toString());
        // set random word to be the word of choice
        answer = words.get((int) random(0, words.size()));
    }
    
    public void draw() {
        // update the current row
        for (int i = currentRow * 4; i < currentRow * 4 + 5; i ++) {
            patches[i].setValue(String.valueOf(currentRowLetters[i - currentRow * 4]));
        }
        
        for (int i = 0; i < 30;  i ++) {
            patches[i].draw();
        }
        
        if (keyPressed && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z') || (key == CODED && (keyCode == ENTER || keyCode == DELETE)))) {
            if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
                letterPressed = true;
                codedPressed = false;
            } else if (key == CODED && keyCode == ENTER) {
                codedPressed = true;
                letterPressed = false;
            }
        } else if (!keyPressed && (letterPressed) && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z'))) {
            if (numberOfLettersInCurrentRow < 5) {
                currentRowLetters[numberOfLettersInCurrentRow] = Character.toUpperCase(key);
                numberOfLettersInCurrentRow++;
            }
        } else if (!keyPressed && (key == CODED && (keyCode == ENTER || keyCode == DELETE))) {
            if (keyCode == ENTER && numberOfLettersInCurrentRow == 5) {
                // use the random word generator to check if the word is valid
                String word = CharArrayToWord(currentRowLetters);
                if (WordValid(word)) {
                    char[] answerArray = WordToCharArray(answer.toUpperCase());
                    for (int i = currentRow * 4; i < currentRow * 4 + 5; i ++) {
                        // if the letter is at the same position as the answer
                        if (currentRowLetters[i - currentRow * 4] == answerArray[i - currentRow * 4]) {
                            patches[i].setValue(String.valueOf(currentRowLetters[i - currentRow * 4]));
                            patches[i].setColor(GREEN);
                        } else if (answer.contains(String.valueOf(currentRowLetters[i - currentRow * 4]))) {
                            // count all occurences of that letter in the answer array
                            int answerOccurences = 0;
                            int currentRowOccurences = 0;
                            for (char e: answerArray) {
                                if (e == currentRowLetters[i - currentRow * 4]) {
                                    answerOccurences++;
                                }
                            }
                            for (int j = 0; j < i - currentRow * 4; j++) {
                                if (currentRowLetters[j] == currentRowLetters[i - currentRow * 4]) {
                                    currentRowOccurences++;
                                }
                            }
                            patches[i].setValue(Character.toString(currentRowLetters[i - currentRow * 4]));
                            if (currentRowOccurences < answerOccurences) {
                                patches[i].setColor(YELLOW);
                            }
                        }
                        
                        //reset to new thing
                        currentRow++;
                        numberOfLettersInCurrentRow = 0;
                        currentRowLetters = new char[]{' ',' ',' ',' ',' '};
                    }
                }
            } else if (keyCode == DELETE && numberOfLettersInCurrentRow > 0) {
                patches[currentRow * 4 + numberOfLettersInCurrentRow - 1].setValue(String.valueOf(' '));
                numberOfLettersInCurrentRow--;
                currentRowLetters[numberOfLettersInCurrentRow] = ' ';
            }
            
            
        }}

        private boolean checkLost() {
            return false;
        }

        private boolean checkWon() {
            return false;
        }

        private boolean WordValid(String word) {
            return words.contains(word.strip().toLowerCase());
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