public class TwentyFortyEight {
    int[][] board;
    Patch[] patches = new Patch[16];
    boolean lost;
    PApplet applet; 
    int WIDTH = 620;
    int HEIGHT = 620;

    color[] colorArray = new color[] {
        color(255, 231, 201), // 0
        color(255, 231, 201), // 2
        color(255, 231, 201), // 4
        color(255, 231, 201), // 8
        color(255, 231, 201), // 16
        color(255, 231, 201), // 32
        color(255, 231, 201), // 64
        color(255, 231, 201), // 128
        color(255, 231, 201), // 256
        color(255, 231, 201), // 512
        color(255, 231, 201), // 1024
        color(255, 231, 201), // 2048
    };


    public TwentyFortyEight(PApplet papplet) {
        applet = papplet;

        surface.setSize(WIDTH, HEIGHT);
        // size(310, 310);
        applet.background(255, 231, 201);

        board = new int[][]{
            {0, 0, 0, 0} , 
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
        while (y < height - 20 && index < 16) {
            if (x >= width - 20) {
                x = initialX;
                y += side + 10;
            }
            patches[index] = new Patch(applet, x, y, side, side, color(211, 211, 211)); 
            x += side + 10;
            patches[index].draw();
            index++;
        }
    }

    void draw() {
        stroke(127, 80, 20);
        fill(127, 80, 20);
        applet.rect(10, 10, 600, 600, 20);

        // draw patches
        for (int i = 0; i < patches.length; i++) {
            patches[i].draw();
        }
     }

        // border 10 px
        // grid 10 px
        // 4 patches each 
        
        //create new patches
    
    public int[] updateState(char event) {
        // update the state based 
        // switch(event) {
        //     //depending on each event
        //     case 'U':
        //         // for each col
        //         // starting from the top check if the next would merge
        //         // if it does merge, and sync locations
        //         break;            
        //     case 'D':
        //         break;            
        //     case 'L':
        //         break;            
        //     case 'R':
        //         break;
        // }
        return new int[]{0};
        // updates the patches based on the 
    }

    public void Run() {
        draw();
        while(!lost) {
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
        //sync the board with the patches
    }
    
    public void addRandomElement() {
        // add a random element to the board
        // if there are no more empty spaces
        // if there are no more moves
    }
}