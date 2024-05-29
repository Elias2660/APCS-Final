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
            stroke(127, 80, 20);
            fill(127, 80, 20);
            applet.rect(10, 10, 600, 600, 20);
            sync();
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
    
    // border 10 px
    // grid 10 px
    // 4patches each 
    
    //create new patches
    
    public void updateState(char event) {
        // update the state based 
        switch(event) {
            //depending on each event
            case 'U':
                // for each col
                // starting from the top check if the next would merge
                // if it does merge, and sync locations

                // ?!?!? CODE NOT CHECKED YET
                for (int c = 0; c < 4; c++) {
                    
                    for (int = 3; r >= 0; r++) {
                        if (board[r][c] == 0) {
                            continue;
                        }
                        int next = r - 1;
                        while (next >= 0 && board[next][c] == 0) {
                            next--;
                        }
                        if (next < 0) {
                            continue;
                        }
                        if (board[r][c] == board[next][c]) {
                            board[next][c] *= 2;
                            board[r][c] = 0;
                        }
                    }
                }
                break;            
            case 'D':
                break; 
            case 'L':
                break;            
            case 'R':
                break;
        }
        }
            
            
            
            public void Run() {
                draw();
                while(!lost){
                    // get the event
                    // update the state
                   // check if the game is lost
                   // add a random element
                    // draw the board
                }
            }
                
                public void checkLost() {
                   // check if the game is lost
                    // if there are no more moves
                    // if there are no more empty spaces
                    // if there are no more merges
                }
                    
                public void sync() {
                       // sync the board with the patches
                        // sync the patches with the board
                      for (int i = 0; i < 16; i++) {
                            if (patches[i].level< board[i / 4][i % 4]) {
                               patches[i].level = board[i / 4][i % 4];
                            } else if (patches[i].level > board[i / 4][i % 4]) {
                               board[i / 4][i % 4] = patches[i].level;
                            }
                        }
                        }
                            
                            public void addRandomElement() {
                               // add a random element to the board
                                // if there are no more empty spaces
                                    // if there are no more moves
                                 ArrayList < Patch > empty = new ArrayList < Patch > ();
                           for (Patch p : patches) {
                                if (p.level == 0) {
                                        empty.add(p);
                                    }
                                    }
                                        empty.get((int)random(empty.size())).setLevel(1);
                                        sync();
                                    }
                                    }