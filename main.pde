
// TwentyFortyEight tfe;
Wordle w;

void setup() { 
    size(400, 400);
    // surface.setResizable(true);
    //  tfe = new TwentyFortyEight(this);
    w = new Wordle(this);
}


void draw() {
    w.draw();
}