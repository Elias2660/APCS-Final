import java.util.concurrent.TimeUnit;
public class TwentyFortyEight {
    int[][] board;
    Patch[] patches = new Patch[16];
    boolean lost;
    PApplet applet; 
    int WIDTH = 620;
    int HEIGHT = 620;
    
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
    
    int[] valueArray = new int[] {
        0, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048
    };
    
    
    public TwentyFortyEight(PApplet papplet) {
        applet = papplet;
        
        surface.setSize(WIDTH, HEIGHT);
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
    
    
    
    void initializePatches() {
        int initialX = 27;
        int initialY = 27;
        int side = 135;
        int x = initialX;
        int y = initialY;
        int index = 0;
        while(y < height - 20 && index < 16) {
            if (x >= width - 20) {
                x = initialX;
                y += side + 10;
            }
            Patch n = new Patch(applet, x, y, side, side, 0, color(211, 211, 211));
            if (!n.showText) {
                n.toggleText();
            }
            patches[index] = n; 
            x += side + 10;
            patches[index].draw();
            index++;
        }
        addRandomElement();
    }
    
    void draw() {
        if (!lost) {
            if (keyPressed) {
                if (key == CODED) {
                    if (keyCode == UP) {
                        for (int c = 0; c < 4; c++) {
                            for (int r = 3; r >= 0; r--) {
                                // check for the nearest element that is not equal to that element
                                // and then move up to one below that element; 
                                // if the element is equal; merge
                                int next = r - 1;
                                if (next >= 0 && next <= 3) {
                                    while(next > 0 && next < 3 && board[r][next] == 0) {
                                        next--;
                                    }
                                    if (board[next][c] == board[r][c] && board[r][c] != 0) {
                                        board[next][c] += 1;
                                        board[r][c] = 0;
                                    } else if (board[next][c] == 0) {
                                        board[next][c] = board[r][c];
                                        board[r][c] = 0;
                                    } 
                                    
                                }
                            }
                        }
                    } 
                    if (keyCode == DOWN) {
                        for (int c = 0; c < 4; c++) {
                            for (int r = 0; r < 4; r++) {
                                // check for the nearest element that is not equal to that element
                                // and then move up to one below that element; 
                                // if the element is equal; merge
                                int next = r + 1;
                                if (next >= 0 && next <= 3) {
                                    while(next > 0 && next < 3 && board[next][c] == 0) {
                                        next++;
                                    }
                                    if (board[next][c] == board[r][c] && board[r][c] != 0) {
                                        board[next][c] += 1;
                                        board[r][c] = 0;
                                    } else if (board[next][c] == 0) {
                                        board[next][c] = board[r][c];
                                        board[r][c] = 0;
                                    } 
                                    
                                }
                            }
                        }
                    }
                    if (keyCode == LEFT) {
                        for (int c = 0; c < 4; c++) {
                            for (int r = 0; r < 4; r++) {
                                // check for the nearest element that is not equal to that element
                                // and then move up to one below that element; 
                                // if the element is equal; merge
                                int next = c - 1;
                                if (next >= 0 && next <= 3) {
                                    while(next > 0 && next < 3 && board[r][next] == 0) {
                                        next--;
                                    }
                                    if (board[r][next] == board[r][c] && board[r][c] != 0) {
                                        board[r][next] += 1;
                                        board[r][c] = 0;
                                    } else if (board[r][next] == 0) {
                                        board[r][next] = board[r][c];
                                        board[r][c] = 0;
                                    } 
                                }
                            }
                        }
                    }
                    if (keyCode == RIGHT) {
                        for (int c = 0; c < 4; c++) {
                            for (int r = 0; r < 4; r++) {
                                // check for the nearest element that is not equal to that element
                                // and then move up to one below that element; 
                                // if the element is equal; merge
                                int next = c + 1;
                                if (next >= 0 && next <= 3) {
                                    while(next > 0 && next < 3 && board[r][next] == 0) {
                                        next++;
                                    }
                                    if (board[r][next] == board[r][c] && board[r][c] != 0) {
                                        board[r][next] += 1;
                                        board[r][c] = 0;
                                    } else if (board[r][next] == 0) {
                                        board[r][next] = board[r][c];
                                        board[r][c] = 0;
                                    } 
                                    }
                            }
                        }   
                    }
                }
                syncP();
                addRandomElement();
                try {

                TimeUnit.SECONDS.sleep(1);
                } catch (InterruptedException e) {

                }
            }
            
            
            
            stroke(127, 80, 20);
            fill(127, 80, 20);
            applet.rect(10, 10, 600, 600, 20);
            syncP();
            // draw patches
            for (int i = 0; i < patches.length; i++) {
                patches[i].setValue(valueArray[patches[i].level]);
                patches[i].setColor(colorArray[patches[i].level]);
                
                
                if (patches[i].level != 0) {
                    patches[i].setValue(valueArray[patches[i].level]);
                    
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
    }
    
    public int getPatchIndex(int row, int col) {
        return row * 4 + col;
    }
    
    public void checkLost() {
        // checkif the game is lost
        // if there are no more moves
        // if there are no more empty spaces
        // if there are no more merges
    }
    
    // work onsync b and sync P!!!!!!
    public void syncP() {
        // sync the board with the patches
        // sync the patches with the board
        for (int i = 0; i < 16; i++) {
            patches[i].level = board[i / 4][i % 4];
            }
        }
    
    public void syncB() {
        // sync the board with the patches
        // sync the patches with the board
        for (int i = 0; i < 16; i++) {
            board[i / 4][i % 4] =  patches[i].level;
            }
        }
    
    public void addRandomElement() {
        // add a random element to the board
        // if there are no more empty spaces
        // if there are no more moves
        syncB();
        syncP();
        ArrayList < Patch > empty = new ArrayList < Patch > ();
        for (Patch p : patches) {
            if (p.level == 0) {
                empty.add(p);
                }
            }
        empty.get((int)random(empty.size())).setLevel((int)(Math.random() * 2) + 1);
        syncB();
        }
    }