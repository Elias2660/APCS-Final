/**
* The Wordle class represents the main game logic for the Wordle game.
* It handles rendering the game elements, handling user input, and determining the game outcome.
* The game board consists of patches that can be filled with letters to guess the hidden word.
* The player has 6 rows to guess the word, and if they fail to guess it within the given number of rows, they lose.
* If the player successfully guesses the word within the given number of rows, they win.
* The game provides feedback on the correctness of the guessed letters.
* The Wordle class also handles displaying the correct answer when the player loses and displaying a victory message when the player wins.
*/
/*
? TODO: WORK on EXTENTIONS
*/

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
    
    private boolean triggered = false;
    
    private color GREEN = color(83, 141, 78);
    private color YELLOW = color(181, 159, 59);
    private color GREY = color(58,58,60);
    
    // the ANSWEr
    private String answer;
    
    // game wincons
    private boolean won = false;
    private boolean lost = false;
    
    /**
    * Constructor for the Wordle class.
    * Initializes the Wordle game with a given PApplet object.
    * Sets up the game board, patches, and the word to guess.
    * 
    * @param papplet The PApplet object used for rendering.
    */
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
                Patch p = new Patch(papplet, w, h, PATCH_WIDTH, PATCH_HEIGHT, color(18,18,19), 0.0, true, color(255, 255, 255));
                patches[index] = p;
                index++;
            }
        }
        words = SortWords.getWords(sketchPath().toString());
        // set random word to be the word of choice
        ArrayList<String> possibleAnswers = SortWords.createAnswerWordList(sketchPath().toString());
        answer = possibleAnswers.get((int) random(0, possibleAnswers.size()));
        System.out.println(answer);
    }
    
    /**
    * The draw method is responsible for rendering the game elements and handling user input.
    * It checks if the game is still ongoing and if the current row is within the valid range.
    * If the game is ongoing and the current row is within the range, it calls the drawElements() 
    * method to render the game elements and the handleKeyPresses() method to handle user input.
    * If the game is lost, it calls the copeWithLoss() method.
    * If the game is won, it calls the handleVictory() method.
    */
    public void draw() {
        if (!lost && !won) {
            if (currentRow <= 5) {
                drawElements();
                handleKeyPresses();
            }
            if (!won && currentRow >= 6) {
                System.out.println("LOST");
                lost = true;
            }
        } else if (lost) {
            copeWithLoss();
        } else if (won) {
            handleVictory();
        }
    }
    
    /**
    * Handles the victory condition in the Wordle game.
    * If the victory condition is met, this method will update the patches on the screen to display the word "YOU WIN!" in yellow.
    * If the victory condition has already been triggered, this method does nothing.
    */
    public void handleVictory() {
        if (!triggered) {
            for (int i = 0; i < 30; i++) {
                patches[i].setColor(GREEN).setValue(" ").draw();
            }
            triggered = true;
        }
        
        patches[0].anchor().setValue("Y").setColor(YELLOW).draw();
        patches[1].anchor().setValue("O").setColor(YELLOW).draw();
        patches[2].anchor().setValue("U").setColor(YELLOW).draw();
        
        patches[5].anchor().setValue("W").setColor(YELLOW).draw();
        patches[6].anchor().setValue("I").setColor(YELLOW).draw();
        patches[7].anchor().setValue("N").setColor(YELLOW).draw();
        patches[8].anchor().setValue("!").setColor(YELLOW).draw();
    }
    
    /**
    * Resets the game state and displays the correct answer when the player loses.
    */
    public void copeWithLoss() {
        if (!triggered) {
            for (int i = 0; i < 30; i++) {
                patches[i].setColor(GREY);
                patches[i].setValue(" ");
                patches[i].draw();
            }
            triggered = true;
        }
        patches[0].anchor().setValue("Y").setColor(GREEN).draw();
        patches[1].anchor().setValue("O").setColor(GREEN).draw();
        patches[2].anchor().setValue("U").setColor(GREEN).draw();
        
        patches[5].anchor().setValue("L").setColor(GREEN).draw();
        patches[6].anchor().setValue("O").setColor(GREEN).draw();
        patches[7].anchor().setValue("S").setColor(GREEN).draw();
        patches[8].anchor().setValue("E").setColor(GREEN).draw();
        
        patches[15].anchor().setValue("A").setColor(GREEN).draw();
        patches[16].anchor().setValue("N").setColor(GREEN).draw();
        patches[17].anchor().setValue("S").setColor(GREEN).draw();
        
        patches[20].anchor().setValue("I").setColor(GREEN).draw();
        patches[21].anchor().setValue("S").setColor(GREEN).draw();
        
        patches[25].anchor().setValue(answer.toUpperCase().substring(0, 1)).setColor(YELLOW).draw();
        patches[26].anchor().setValue(answer.toUpperCase().substring(1, 2)).setColor(YELLOW).draw();
        patches[27].anchor().setValue(answer.toUpperCase().substring(2, 3)).setColor(YELLOW).draw();
        patches[28].anchor().setValue(answer.toUpperCase().substring(3, 4)).setColor(YELLOW).draw();
        patches[29].anchor().setValue(answer.toUpperCase().substring(4, 5)).setColor(YELLOW).draw();
    }
    
    
    /**
    * Handles key presses and performs corresponding actions based on the pressed key.
    */
    public void handleKeyPresses() {  
        if (keyPressed && (((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) || ((key == ENTER || key == RETURN || key == DELETE || key == BACKSPACE)))) {
            if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
                // System.out.println("letter pressed: " + key);
                letterPressed = true;
                codedPressed = false;
            } else if ((key == ENTER || key == DELETE || key == RETURN || key == BACKSPACE)) {
                // System.out.println("coded pressed" );
                codedPressed = true;
                letterPressed = false;
            }
        } else if (!keyPressed && (letterPressed) && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z'))) {
            // System.out.println("entering letter");
            if (numberOfLettersInCurrentRow < 5) {
                currentRowLetters[numberOfLettersInCurrentRow] = Character.toUpperCase(key);
                numberOfLettersInCurrentRow++;
                letterPressed = false;
            }
        } else if (!keyPressed && codedPressed && (key == ENTER || key == DELETE || key == RETURN || key == BACKSPACE)) {
            if ((key == ENTER || key == RETURN) && numberOfLettersInCurrentRow == 5) {
                handleEnters();
                
            } else if ((key == DELETE || key == BACKSPACE) && numberOfLettersInCurrentRow > 0) {
                handleDeletes();
            }
            codedPressed = false;
        }
    }
    /**
    * Handles the logic for processing user input when the enter key is pressed.
    */
    private void handleEnters() {
        int count = 0;
        String word = CharArrayToWord(currentRowLetters);
        if (WordValid(word)) {
            char[] answerArray = WordToCharArray(answer.toUpperCase());
            for (int i = currentRow * 5; i < currentRow * 5 + 5; i ++) {
                // if the letter is at the same position as the answer
                if (currentRowLetters[i - currentRow * 5] == answerArray[i - currentRow * 5]) {
                    patches[i].setColor(GREEN);
                    count++;
                } else if (answer.toUpperCase().contains(String.valueOf(currentRowLetters[i - currentRow * 5]).strip().toUpperCase())) {
                    // count all occurences of that letter in the answer array
                    int answerOccurences = 0;
                    int currentRowOccurences = 0;
                    for (char e : answerArray) {
                        if (e == currentRowLetters[i - currentRow * 5]) {
                            answerOccurences++;
                        }
                    }
                    for (int j = 0; j < i - currentRow * 5; j++) {
                        if (currentRowLetters[j] == currentRowLetters[i - currentRow * 5]) {
                            currentRowOccurences++;
                        }
                    }
                    // patches[i].setValue(Character.toString(currentRowLetters[i - currentRow * 5]));
                    if (currentRowOccurences < answerOccurences) {
                        patches[i].setColor(YELLOW);
                    }
                } else {
                    patches[i].setColor(GREY);
                }
            }
            //reset to new thing
            if (count == 5) {
                won = true;
            }
            
            currentRow++;
            numberOfLettersInCurrentRow = 0;
            currentRowLetters = new char[]{' ',' ',' ',' ',' '};
        }
    }
    
    /**
    * Handles the deletion of a letter in the current row of the Wordle game.
    * This method updates the patches array and the currentRowLetters array
    * to remove the last letter in the current row.
    */
    public void handleDeletes() {
        patches[currentRow * 5 + numberOfLettersInCurrentRow - 1].setValue(String.valueOf(' '));
        numberOfLettersInCurrentRow--;
        currentRowLetters[numberOfLettersInCurrentRow] = ' ';
    }
    
    
    /**
    * Draws the elements on the screen.
    * This method iterates through the patches array and sets the value of each patch based on the currentRowLetters array.
    * It also toggles the text visibility of each patch if the corresponding letter in currentRowLetters is not a space and the patch is not already showing text.
    * Finally, it calls the draw() method for each patch to display them on the screen.
    */
    private void drawElements() {
        for (int i = currentRow * 5; i < currentRow * 5 + 5; i ++) {
            if (currentRowLetters[i - currentRow * 5] != ' ' && !patches[i].isShowingText()) {
                patches[i].toggleText();
            }
            patches[i].setValue(Character.toString(currentRowLetters[i - currentRow * 5]));
        }
        
        for (int i = 0; i < 30;  i ++) {
            patches[i].draw();
        }
    }
    
    
    /**
    * Checks if a word is valid.
    * 
    * @param word the word to be checked
    * @return true if the word is valid, false otherwise
    */
    private boolean WordValid(String word) {
        return words.contains(word.strip().toLowerCase());
    }
    
    /**
    * Converts a character array to a string.
    * 
    * @param word the character array to be converted
    * @return the converted string
    */
    private String CharArrayToWord(char[] word) {
        String str = "";
        for (char c : word) {
            str += c;
        }
        return str;
    }
    
    /**
    * Converts a string to a character array.
    * 
    * @param word the string to be converted
    * @return the converted character array
    */
    private char[] WordToCharArray(String word) {
        return word.toCharArray();
    }
}
