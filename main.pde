

TwentyFortyEight tfe;
Wordle w;
<<<<<<< HEAD
TicTacToe ttt;

int button = 255;
int highlight = 150;
int text = 0;
int back = #32a8a8;

int game = 0;
=======
int button = 255;
int highlight = 150;
int text = 0;
int back = #32a8a8;

int game = 0;

void setup() { 
    size(400, 400);
}
>>>>>>> 1f1942b (Fixed wordle, added menu)

public void mainMenu() {
  windowResize(400,400);
  background(back);
<<<<<<< HEAD
  fill(text);
  textAlign(CENTER);
  textSize(30);
  stroke(0);
  strokeWeight(0.5);
=======
  //System.out.println(sketchPath());
  //background();
  fill(text);
  textAlign(CENTER);
  textSize(30);
>>>>>>> 1f1942b (Fixed wordle, added menu)
  text("Welcome to Processing Arcade", 200, 40);
  textAlign(LEFT);
  textSize(10);
  text("- Elias Xu, Arman Johal", 300, 60);
  
<<<<<<< HEAD
  makeCenterButton(50,100,300,30,button,highlight,text,"Twenty Forty Eight");
  makeCenterButton(50,200,300,30,button,highlight,text,"Wordle");
  makeCenterButton(50,300,300,30,button,highlight,text,"Tictactoe"); 
=======
  
  
  
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
  
  
>>>>>>> 1f1942b (Fixed wordle, added menu)
  
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
<<<<<<< HEAD
      ttt.draw();
=======
>>>>>>> 1f1942b (Fixed wordle, added menu)
    break;
  
  }
  if(game != 0) {
    fill(button);
<<<<<<< HEAD
    stroke(0);
    strokeWeight(0.5);
=======
>>>>>>> 1f1942b (Fixed wordle, added menu)
    if(mouseOverRect(width - 80 ,1,70,20)) fill(highlight);
    rect(width - 80 ,1,70,20);
    fill(text);
    textAlign(CENTER);
    textSize(20);
    text("Quit", width - 80, 3, 70, 20);
  }
  
<<<<<<< HEAD
=======
    //w.draw();
    //tfe.draw();
>>>>>>> 1f1942b (Fixed wordle, added menu)
}

void mouseClicked() {
  switch(game){
    case 0:
      if(mouseOverRect(50,100,300,30)) {game = 1; tfe = new TwentyFortyEight(this);}
      if(mouseOverRect(50,200,300,30)) {game = 2; w = new Wordle(this);}
<<<<<<< HEAD
      if(mouseOverRect(50,300,300,30)) {game = 3; ttt = new TicTacToe();}
=======
      if(mouseOverRect(50,300,300,30)) {game = 3;}
>>>>>>> 1f1942b (Fixed wordle, added menu)
    break;
    
    case 1:
    break;
    
    case 2:
    break;
    
    case 3:
<<<<<<< HEAD
      ttt.mouseClicked();
=======
>>>>>>> 1f1942b (Fixed wordle, added menu)
    break;
    
  }
  
  if(game != 0 && mouseOverRect(width - 80 ,1,70,20)) game = 0;
}

<<<<<<< HEAD
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
=======
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
>>>>>>> 1f1942b (Fixed wordle, added menu)
