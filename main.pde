

TwentyFortyEight tfe;
Wordle w;
TicTacToe ttt;

int button = 255;
int highlight = 150;
int text = 0;
int back = #32a8a8;

int game = 0;

public void mainMenu() {
  windowResize(400,400);
  background(back);
  fill(text);
  textAlign(CENTER);
  textSize(30);
>>>>>>> 1f1942b (Fixed wordle, added menu)
  text("Welcome to Processing Arcade", 200, 40);
  textAlign(LEFT);
  textSize(10);
  text("- Elias Xu, Arman Johal", 300, 60);
  
  
  
  
  fill(button);
  if(mouseOverRect(50,100,300,30)) fill(highlight);
  rect(50, 100, 300, 30);
  
  fill(button);
  if(mouseOverRect(50,200,300,30)) fill(highlight);
  rect(50, 200, 300, 30);
  
  fill(button);
  if(mouseOverRect(50,300,300,30)) fill(highlight);
  rect(50, 300, 300, 30);
  
  
  fill(text);
  textAlign(CENTER);
  textSize(20);
  text("Twenty Forty Eight", 200, 120);
  text("Wordle", 200, 220);
  text("Tictactoe", 200, 320);
  
  
  
}


void draw() {
  switch(game){
    case 0:
      mainMenu();
    break;
    
    case 1:
      tfe.draw();
    break;
    
    case 2:
      w.draw();
    break;
    
    case 3:
      ttt.draw();
    break;
  
  }
  if(game != 0) {
    fill(button);
    if(mouseOverRect(width - 80 ,1,70,20)) fill(highlight);
    rect(width - 80 ,1,70,20);
    fill(text);
    textAlign(CENTER);
    textSize(20);
    text("Quit", width - 80, 3, 70, 20);
  }
  
    //w.draw();
    //tfe.draw();
}

void mouseClicked() {
  switch(game){
    case 0:
      if(mouseOverRect(50,100,300,30)) {game = 1; tfe = new TwentyFortyEight(this);}
      if(mouseOverRect(50,200,300,30)) {game = 2; w = new Wordle(this);}
      if(mouseOverRect(50,300,300,30)) {game = 3; ttt = new TicTacToe();}
    break;
    
    case 1:
    break;
    
    case 2:
    break;
    
    case 3:
      ttt.mouseClicked();
    break;
    
  }
  
  if(game != 0 && mouseOverRect(width - 80 ,1,70,20)) game = 0;
}

void keyPressed() {
switch(game){
    case 0:
    break;
    
    case 1:
      tfe.handleKeyPresses();
    break;
    
    case 2:
      w.handleKeyPresses();
    break;
    
    case 3:
    break;
  
  }

}

public boolean mouseOverRect(int x, int y, int w, int h) {
  return (mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h);
}
