/**
 * The TwentyFortyEight class represents the game board and its functionality.
 * It includes methods for initializing the patches, handling key presses, drawing the patches,
 * synchronizing the board with the patches, adding random elements, and handling movement in different directions.
 * The game can be won or lost, and the class includes methods for checking the game state and ending the game.
 */
/*
TODO: add a points monitor at the back

*/
import java.util.Arrays;
public class TwentyFortyEight {
    /**
     * The TwentyFortyEight class represents the game board and its properties.
     * It contains the board, patches, game status, applet, dimensions, color array, and value array.
     **/
    private int[][] board;
    private Patch[] patches = new Patch[16];
    private PApplet applet; 
    private int WIDTH = 620;
    private int HEIGHT = 620;
    private boolean lost = false;
    private boolean won = false;
    private boolean lastPressed = false;


    /**
     * An array of colors used to represent different values on the game board.
     */
    color[] colorArray = new color[] {
        color(211, 211, 211), // 0
        color(255, 255, 0),   // 2
        color(255, 165, 0),   // 4
        color(255, 69, 0),    // 8
        color(255, 0, 0),     // 16
        color(255, 0, 255),   // 32
        color(0, 0, 255),     // 64
        color(0, 255, 255),   // 128
        color(0, 255, 0),     // 256
        color(0, 128, 0),     // 512
        color(0, 0, 128),     // 1024
        color(128, 0, 128)    // 2048
    };

    /**
     * An array of values corresponding to the colors in the colorArray.
     */
    int[] valueArray = new int[] {
        0, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048
    };
    
    /**
     * Constructor for the TwentyFortyEight class.
     * Initializes the game board and patches.
     *
     * @param papplet The PApplet object used for rendering.
     */
    public TwentyFortyEight(PApplet papplet) {
        applet = papplet;
        
        windowResize(WIDTH, HEIGHT);
        // size(310, 310);
        applet.background(255, 231, 201);
        
        board = new int[][]{
            {0, 0, 0, 0} , 
            {0,0,0,0} ,
            {0,0,0,0} ,
            {0,0,0,0}
        };
        //initialize patches
        initializePatches();
    }
    
    /**
     * Initializes the patches and adds a random element.
     * Patches are created with a specific size and color, and their text is toggled on.
     * The patches are stored in an array.
     * The method continues creating patches until the screen is filled or the maximum number of patches is reached.
     */
    void initializePatches() {
        // Initialize variables
        int initialX = 27;
        int initialY = 27;
        int side = 135;
        int x = initialX;
        int y = initialY;
        int index = 0;
        
        // Create patches
        while (y < height - 20 && index < 16) {
            // Reset x position if it exceeds the width
            if (x >= width - 20) {
                x = initialX;
                y += side + 10;
            }
            
            // Create a new Patch object with specified parameters
            Patch n = new Patch(applet, x, y, side, side, 0, color(211, 211, 211));
            
            // Toggle the text display of the patch if it is not already shown
            if (!n.showText) {
                n.toggleText();
            }
            
            // Store the patch in the patches array
            patches[index] = n;
            
            // Move to the next x position
            x += side + 10;
            
            // Draw the patch
            patches[index].draw();
            
            // Move to the next index
            index++;
        }
        
        // Add a random element
        addRandomElement();
    }

    /**
     * Handles key presses and updates the game state accordingly.
     * Checks if the game is lost or won after each key press.
     * If the game is lost, calls the ENDLOST() function.
     * If the game is won, calls the ENDWON() function.
     */
    void draw() {
        // Check if the game is still ongoing
        if (!lost && !won) {
            // Check if a key is currently pressed
            if (keyPressed) {
                lastPressed = true;
            } else if (!keyPressed && lastPressed) {
                // Handle key presses and update game state
                handleKeyPresses();
                lastPressed = false;
            }
            
            // Draw the patches
            drawPatches();
            
            // Check if the game is lost
            lost = checkLost();
            
            // Check if the game is won
            won = checkWon();
        } else if (lost) {
            // Call the ENDLOST() function
            ENDLOST();
        } else if (won) {
            // Call the ENDWON() function
            ENDWON();
        }
    }
    
    /**
     * Handles key presses and updates the game board accordingly.
     */
    public void handleKeyPresses() {
        boolean changed = false;
        if (key == CODED) {
            if (keyCode == UP) {
                changed = handleUP(board);
            } 
            if (keyCode == DOWN) {
                changed = handleDown(board);
            }
            if (keyCode == LEFT) {
                changed = handleLeft(board);
            }
            if (keyCode == RIGHT) {
                changed = handleRight(board);
            }
        }
        
        syncP();
        if (changed) {
            addRandomElement();
            changed = false;
        }
        syncP();
    }
    
    /**
     * Draws the patches on the screen.
     * Each patch is assigned a value and color based on its level.
     * If the patch's level is not 0, its value is displayed.
     * If the patch's level is 0, its value is not displayed.
     */
    public void drawPatches() {
        for (int i = 0; i < patches.length; i++) {
            patches[i].setValue(String.valueOf(valueArray[patches[i].level]));
            patches[i].setColor(colorArray[patches[i].level]);
            
            if (patches[i].level != 0) {
                patches[i].setValue(String.valueOf(valueArray[patches[i].level]));
                
                if (!patches[i].showText) {
                    patches[i].toggleText();
                }
            } else if (patches[i].level == 0) {
                if (patches[i].showText) {
                    patches[i].toggleText();
                }
            }
            
            patches[i].draw();
        }
    }
    
    
    /**
     * Synchronizes the patches with the board and vice versa.
     * Updates the level of each patch based on the corresponding value in the board.
     */
    public void syncP() {
        for (int i = 0; i < 16; i++) {
            patches[i].level = board[i / 4][i % 4];
        }
    }
    
    /**
     * Synchronizes the game board with the patches.
     * Updates the patches with the current state of the game board.
     */
    public void syncB() {
        // sync the board with the patches
        // sync the patches with the board
        for (int i = 0; i < 16; i++) {
            board[i / 4][i % 4] = patches[i].level;
        }
    }
    
    /**
     * Adds a random element to the board.
     * If there are no more empty spaces or no more moves, the board remains unchanged.
     */
    public void addRandomElement() {
        syncB();
        syncP();
        ArrayList<Patch> empty = new ArrayList<Patch>();
        for (Patch p : patches) {
            if (p.level == 0) {
                empty.add(p);
            }
        }
        empty.get((int)random(empty.size())).setLevel((int)(Math.random() * 2) + 1);
        syncB();
    }
    
    
    
    /**
     * Handles the movement of the tiles in the upward direction.
     * 
     * @param board The game board represented as a 2D array.
     * @return true if any tiles were moved or merged, false otherwise.
     */
    private boolean handleUP(int[][] board) {
        boolean changed = false;
        for (int c = 0; c < 4; c++) {
            for (int r = 0; r <= 3; r++) {
                // check for the nearest element that is not equal to that element
                // and then move up to one below that element; 
                // if the element is equal; merge
                int next = r - 1;
                if (next >= 0 && next <= 3) {
                    while(next >0 && next < 3 && board[next][c] == 0) {
                        next--;
                    }
                    if (board[next][c] == board[r][c] && board[r][c] != 0) {
                        board[next][c] += 1;
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[next][c] == 0) {
                        board[next][c] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[next + 1][c] == 0 && board[r][c] != 0) {
                        board[next + 1][c] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    }
                    
                }
            }
        }
        return changed;
    }


    /**
     * Handles the movement of the tiles in the downward direction.
     * 
     * @param board The game board represented as a 2D array.
     * @return true if any tiles were moved or merged, false otherwise.
     */
    private boolean handleDown(int[][] board) {
        boolean changed = false;
        for (int c = 0; c < 4; c++) {
            for (int r = 3; r >= 0; r--) {
                // check for the nearest element that is not equal to that element
                // and then move up to one below that element; 
                // if the element is equal; merge
                int next = r + 1;
                if (next >= 0 && next <= 3) {
                    while(next >0 && next < 3 && board[next][c] == 0) {
                        next++;
                    }
                    if (board[next][c] == board[r][c] && board[r][c] != 0) {
                        board[next][c] += 1;
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[next][c] == 0) {
                        board[next][c] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[next - 1][c] == 0 && board[r][c] != 0) {
                        board[next - 1][c] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    }
                    
                }
            }
        }
        return changed;
    }


    /**
     * Handles the movement of the tiles in the left direction.
     * 
     * @param board The game board represented as a 2D array.
     * @return true if any tiles were moved or merged, false otherwise.
     */
    private boolean handleLeft(int[][] board) {
        boolean changed = false;
        for (int r = 0; r < 4; r++) {
            for (int c = 0; c < 4; c++) {
                // check for the nearest element that is not equal to that element
                // and then move up to one below that element; 
                // if the element is equal; merge
                int next = c - 1;
                if (next >= 0 && next <= 3) {
                    while(next >0 && next < 3 && board[r][next] == 0) {
                        next--;
                    }
                    if (board[r][next] == board[r][c] && board[r][c] != 0) {
                        board[r][next] += 1;
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[r][next] == 0) {
                        board[r][next] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[r][next + 1] == 0 && board[r][c] != 0) {
                        board[r][next + 1] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    }
                }
            }
        }
        return changed;
    }


    /**
     * Handles the movement of the tiles in the right direction.
     * 
     * @param board The game board represented as a 2D array.
     * @return true if any tiles were moved or merged, false otherwise.
     */
    private boolean handleRight(int[][] board) {
        boolean changed = false;
        for (int r = 0; r < 4; r++) {
            for (int c = 3; c >= 0; c--) {
                // check for the nearest element that is not equal to that element
                // and then move up to one below that element; 
                // if the element is equal; merge
                int next = c + 1;
                if (next >= 0 && next <= 3) {
                    while(next >0 && next < 3 && board[r][next] == 0) {
                        next++;
                    }
                    if (board[r][next] == board[r][c] && board[r][c] != 0) {
                        board[r][next] += 1;
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[r][next] == 0) {
                        board[r][next] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    } else if (board[r][next - 1] == 0 && board[r][c] != 0) {
                        board[r][next - 1] = board[r][c];
                        board[r][c] = 0;
                        changed = true;
                    }
                }
            }
        }   
        return changed;
    }
    /**
     * Checks if the game is lost by determining if there are no more moves, no more empty spaces, or no more merges.
     * 
     * @return true if the game is lost, false otherwise
     */
    public boolean checkLost() {
        int num = 0;
        int[][] copy = deepCopy(board);
        handleUP(copy);
        if (Arrays.deepEquals(copy, board)) {
            num++;  
        }
        
        copy = deepCopy(board);
        handleDown(copy);
        if (Arrays.deepEquals(copy, board)) {
            num++;  
        }
        
        copy = deepCopy(board);
        handleLeft(copy);
        if (Arrays.deepEquals(copy, board)) {
            num++;  
        }
        
        copy = deepCopy(board);
        handleRight(copy);
        if (Arrays.deepEquals(copy, board)) {
            num++;  
        }
        return num == 4;
    }
    /**
     * Resets the patches to their initial state, clearing their values and setting their levels to 0.
     * Then, it sets specific patches to spell out the word "YOU LOST" and displays them on the screen.
     */
    public void ENDLOST() {
        
        for (int i = 0; i < patches.length; i++) {
            if (!patches[i].getValue().matches("[A-Z\\s]+")) {
                patches[i].level = 0;
                patches[i].draw();
                patches[i].setValue("");
                if (patches[i].showText) {
                    patches[i].toggleText();
                }
            }
        }
        
        patches[0].setValue("Y").toggleText().anchor().draw();
        patches[1].setValue("O").toggleText().anchor().draw();
        patches[2].setValue("U").toggleText().anchor().draw();
        
        patches[4].setValue("L").toggleText().anchor().draw();
        patches[5].setValue("O").toggleText().anchor().draw();
        patches[6].setValue("S").toggleText().anchor().draw();
        patches[7].setValue("T").toggleText().anchor().draw();
    }
    /**
     * Resets the game state when the player wins.
     * Sets the level of all patches to 0, clears their values, and hides their text.
     * Displays the message "YOU WON" on the top row of patches.
     */
    public void ENDWON() {
        for (int i = 0; i < patches.length; i++) {
            if (!patches[i].getValue().matches("[A-Z\\s]+")) {
                patches[i].level = 0;
                patches[i].draw();
                patches[i].setValue("");
                if (patches[i].showText) {
                    patches[i].toggleText();
                }
            }
        }
        
        patches[0].setValue("Y").toggleText().anchor().draw();
        patches[1].setValue("O").toggleText().anchor().draw();
        patches[2].setValue("U").toggleText().anchor().draw();
        
        patches[4].setValue("W").toggleText().anchor().draw();
        patches[5].setValue("O").toggleText().anchor().draw();
        patches[6].setValue("N").toggleText().anchor().draw();
    }
    
    
    /**
     * Checks if the player has won the game.
     * 
     * @return true if the player has won, false otherwise
     */
    public boolean checkWon() {
        for (Patch p : patches) {
            if (p.level == 11) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * Creates a deep copy of a 2D integer array representing a game board.
     * 
     * @param board The original game board to be copied.
     * @return A deep copy of the original game board.
     */
    private int[][] deepCopy(int[][] board) {
        int[][] copy = new int[4][4];
        for (int i = 0; i < 4; i++) {
            copy[i] = Arrays.copyOf(board[i], board[i].length);
        }
        return copy;
    }
}
