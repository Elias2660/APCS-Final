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
  
  void mousePressed(){
    System.out.printf("%s, %s", mouseX, mouseY);
  }
  
  public void draw() {
    strokeWeight(1);
    fill(0,0,0,0);
    pushMatrix();
    translate(width/2 - 15*10, height / 2 - 15*10);
    scale(10);
    drawGrid();
    //addX(0,1);
    int x = 0;
    int y = 0;
    if(mousePressed){
      if(mouseX < (width / 3)) x = 0;
      else if(mouseX < (width / 3)) x = 1;
      else if(mouseX > 2*(width / 3)) x = 2;
      
      if(mouseY < (height / 3)) y = 0;
      else if(mouseY < (height / 3)) y = 1;
      else if(mouseY > 2*(height / 3)) y =2;
      System.out.printf("%s,%s\n", y, x);
      
      
    }
    
    //mousePressed();
    //148, 42
    //46, 148
    popMatrix();
    
    
    //drawGrid();
    //
    
  }
  
  private void drawGrid(){
    line(10,0,10,30);
    line(20,0,20,30);
    line(0,10,30,10);
    line(0,20,30,20);
  }
  
  private void addX(int x, int y) {
   board[x][y] = 1;
   float i = 10.5;
   line(2+i*y,2+i*x,7+i*y,7+i*x);
   line(2+i*y,7+i*x,7+i*y,2+i*x);
}
  
  private void addO(int x, int y) {
   board[x][y] = 2;
   float i = 10;
   ellipse(5+i*y,5+i*x, 6, 6);
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
