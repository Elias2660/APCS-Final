public class TicTacToe implements Game {
  private int player1, player2 = 0;
  private boolean isPlayer1Turn = false;
  private int[][] board = new int[3][3];
  
  public TicTacToe() {}
  
  public void setup() {
    player1 = 0; 
    player2 = 0;
    reset();
  }
  
  public void draw() {
    
  }
  
  private void reset() {
    isPlayer1Turn = false;
    board = new int[3][3];
  }
  
  private boolean checkWin() {
  
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
  }
  private boolean checkDia() {
    int player = 2;
    if(isPlayer1Turn) player = 1;
  }
}
