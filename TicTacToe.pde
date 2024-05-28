public class TicTacToe implements Game {
  private int player1, player2 = 0;
  private boolean isPlayer1Turn = false;
  private int[][] board = new int[3][3];
  private float scale = 2;
  
  public TicTacToe() {}
  
  public void setup() {
    player1 = 0; 
    player2 = 0;
    reset();
  }
  
  public void draw() {
    pushMatrix();
    scale(10.0);
    translate(4.5,4.5);
    drawGrid();
    addX(0,0);
    popMatrix();
  }
  
  private void drawGrid(){
    line(10,0,10,30);
    line(20,0,20,30);
    line(0,10,30,10);
    line(0,20,30,20);
  }
  
  private void addX(int x, int y) {
   board[x][y] = 1;
   line(0,0,5,5);
   line(0,5,5,0);

}
  
  private void addO(int x, int y) {
   board[x][y] = 2; 
  }
  
  private void reset() {
    isPlayer1Turn = false;
    board = new int[3][3];
  }
  
  private boolean checkWin(int x, int y) {
    return checkRow(x) || checkCol(y) || checkDia();
  }

  private boolean checkRow(int r) {
    int player = 2;
    if(isPlayer1Turn) player = 1;
    boolean total = true;
    for(int i : board[r]) {
      total &= i == player;
    }
    return total;
  
  }
  
  private boolean checkCol(int c) {
    int player = 2;
    if(isPlayer1Turn) player = 1;
    boolean total = true;
    for(int[] i : board) {
      total &= i[c] == player;
    }
    return total;
  }
  
  
  private boolean checkDia() {
    int player = 2;
    if(isPlayer1Turn) player = 1;
    boolean left = true;
    boolean right = true;
    left &= player == board[0][0] && player == board[1][1] && player == board[2][2];
    right &= player == board[0][2] && player == board[1][1] && player == board[2][0];
    return left || right;
  }
}
