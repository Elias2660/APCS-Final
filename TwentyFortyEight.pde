public class TwentyFortyEight {
    int[][] board;
    boolean lost;
    
    public TwentyFortyEight() {
        
        surface.setSize(1240, 1240);
        // size(310, 310);
        board = new int[][]{
            {0, 0, 0, 0} , 
            {0,0,0,0} ,
            {0,0,0,0}
        };
        
        //create new patches
    }
    
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
    
    public void draw() {
        // draw the board
        // draw the numbers
        // draw the grid
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