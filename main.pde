

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
  stroke(0);
  strokeWeight(0.5);
  text("Welcome to Processing Arcade", 200, 40);
  textAlign(LEFT);
  textSize(10);
  text("- Elias Xu, Arman Johal", 300, 60);
  
  makeCenterButton(50,100,300,30,button,highlight,text,"Twenty Forty Eight");
  makeCenterButton(50,200,300,30,button,highlight,text,"Wordle");
  makeCenterButton(50,300,300,30,button,highlight,text,"Tictactoe"); 
  
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
    stroke(0);
    strokeWeight(0.5);
    if(mouseOverRect(width - 80 ,1,70,20)) fill(highlight);
    rect(width - 80 ,1,70,20);
    fill(text);
    textAlign(CENTER);
    textSize(20);
    text("Quit", width - 80, 3, 70, 20);
  }
  
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

public boolean mouseOverRect(int x, int y, int w, int h) {
  return (mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h);
}

public void makeCenterButton(int x, int y, int w, int h, int buttonColor, int highlightColor, int textColor, String text){
  fill(buttonColor);
  stroke(0);
  strokeWeight(0.5);
  if(mouseOverRect(x,y,w,h)) fill(highlightColor);
  rect(x, y, w, h);
  fill(textColor);
  textAlign(CENTER);
  textSize(20);
  text(text, width/2, y+20);
}
