public class TicTacToe implements Game {
  private int player1, player2 = 0;
  private boolean isPlayer1Turn = false;
  private int[][] board = new int[3][3];
  private int windowSize = 800;
  private float scaleFactor = windowSize / 40.0;
  
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
    windowResize(windowSize,windowSize);
    strokeWeight(1);
    fill(0,0,0,0);
    pushMatrix();
    
    translate(width/2 - 15*scaleFactor, height / 2 - 15*scaleFactor);
    scale(scaleFactor);
    drawGrid();
    
    int r = 0;
    int c = 0;
    if(mousePressed){
      if(mouseX < (width / 3)) r = 0;
      else if(mouseX > (width / 3) && mouseX < 2*(width / 3)) r = 1;
      else r = 2;
      
      if(mouseY < (height / 3)) c = 0;
      else if(mouseY > (height / 3) && mouseY < 2*(height / 3)) c = 1;
      else c = 2;
      
      
    }
    
    if(mousePressed){
      addO(r, c);
    }
    
    
    popMatrix();    
  }
  
  private void drawGrid(){
    line(10,0,10,30);
    line(20,0,20,30);
    line(0,10,30,10);
    line(0,20,30,20);
  }
  
  private void addX(int r, int c) {
   board[r][c] = 1;
   float offset = 10.5;
   line(2 + offset*r, 2 + offset*c, 7 + offset*r, 7 + offset*c);
   line(2 + offset*r, 7 + offset*c, 7 + offset*r, 2 + offset*c);
}
  
  private void addO(int r, int c) {
   board[r][c] = 2;
   float offset = 10;
   ellipse(5 + offset*r, 5 + offset*c, 6, 6);
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
