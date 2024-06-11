public class TicTacToe implements Game {
    
    private int player1, player2 = 0;
    private boolean isPlayer1Turn = true;
    private int[][] board = new int[3][3];
    private int windowSize = 800;
    private float scaleFactor = windowSize / 40.0;
    
    public TicTacToe() {
        
    }
    
    public void setup() {
        player1 = 0; 
        player2 = 0;
        reset();
    }
    
    public void  mouseClicked() {
        int r, c;
        if (pmouseX < (width / 3)) {
            r = 0;
        }
        else if (pmouseX > (width / 3) && pmouseX < 2 * (width / 3)) {
            r = 1;
        }
        else {
            r = 2;
        }

        if (pmouseY < (height / 3)) {
            c = 0;
        }
        else if (pmouseY > (height / 3) && pmouseY < 2 * (height / 3)) {
            c = 1;
        }
        else {
            c = 2;
        }
        
        if (mouseButton == LEFT && isPlayer1Turn && board[r][c] == 0) {
            board[r][c] = 1;
            isPlayer1Turn = false;
            if (checkWin(r, c, 1)) {
                player1++; 
                reset();
                return;
            }
            
        }
        else if (mouseButton == RIGHT && !isPlayer1Turn && board[r][c] == 0) {
            board[r][c] = 2;
            isPlayer1Turn = true;
            if (checkWin(r, c, 2)) {
                player2++;
                reset();
                return;
            }
            
        }
        
        if (checkFull()) { 
            reset();
        }
        
        
    }
    
    public void draw() {
        windowResize(windowSize,windowSize);
        strokeWeight(1);
        fill(0,0,0,0);
        pushMatrix();
        
        translate(width / 2 - 15 * scaleFactor, height / 2 - 15 * scaleFactor);
        scale(scaleFactor);
        
        drawGrid();
        
        popMatrix();    
        fill(255);
        textSize(20);
        text("PLAYER 1: " + player1 + "\nPLAYER 2: " + player2, 0, 20, 300, 60); 
        
    }
    
    private void winScreen() {
        fill(255);
        strokeWeight(0.3);
        rect(05, 10,20, 10);
        fill(0);
        strokeWeight(1);
        text("Player1 won!", 0, 10, 0, 5);
    }
    
    private void drawGrid() {
        background(#cccccc);
        line(10,0,10,30);
        line(20,0,20,30);
        line(0,10,30,10);
        line(0,20,30,20);
        
        for (int i = 0; i < board.length; i++) { 
            for (int j = 0; j < board[0].length; j++) {
                if (board[i][j] == 1) {
                    addX(i,j);
                }
                else if (board[i][j] == 2) {
                    addO(i, j);
                }
            }
        }
        
    }
    
    private void addX(int r, int c) {
        
        float offset = 10.5;
        line(2 + offset * r,2 + offset * c, 7 + offset * r, 7 + offset * c);
        line(2 + offset * r,7 + offset * c, 7 + offset * r, 2 + offset * c);
    }
    
    private void addO(int r, int c) {
        float offset = 10;
        ellipse(5 + offset * r, 5 + offset * c, 6, 6);
    }
    
    private void reset() {
        isPlayer1Turn = true;
        board = new int[3][3];
        background(#cccccc);
        drawGrid();
        
    }
    
    private boolean checkWin(int x, int y, int player) {
        return checkRow(x, player) || checkCol(y, player) || checkDia(player);
    }
    
    private boolean checkRow(int r, int player) {
        boolean total = true;
        for (int i : board[r]) {
            total &= i == player;
        }
        return total;
        
    }
    
    private boolean checkCol(int c, int player) {
        boolean total = true;
        for (int[] i : board) {
            total &= i[c] == player;
        }
        return total;
    }
    
    
    private boolean checkDia(int player) {
        boolean left = true;
        boolean right = true;
        left &= player == board[0][0] && player == board[1][1] && player == board[2][2];
        right &=  player == board[0][2] && player == board[1][1] && player == board[2][0];
        return left || right;
    }
    
    private boolean checkFull() {
        boolean spaceFilled = true;
        for (int[] i : board) for (int j : i) spaceFilled &= j != 0;
        return spaceFilled;
    }
}
