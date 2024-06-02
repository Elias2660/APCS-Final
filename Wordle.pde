public class Wordle {
    Patch[] patches;
    PApplet papplet;
    public Wordle(PApplet papplet) {
        applet.background(255);
        // 5 x 6 board
        // so with each path being 30 x 30
        int PATCH_WIDTH = 30;
        int PATCH_HEIGHT = 30;
        int BORDER_WIDTH = 10;
        int WIDTH = PATCH_WIDTH * 5 + BORDER_WIDTH * 6;
        int HEIGHT = PATCH_HEIGHT * 6 + PATCH_WIDTH * 7;
        windowResize(WIDTH, HEIGHT);
        patches = new Patch[5 * 6];
        int index = 0;
        for (int h = BORDER_WIDTH; h < HEIGHT; h += PATCH_HEIGHT + BORDER_WIDTH) {
            for (int w = BORDER_WIDTH; w < WIDTH; w += PATCH_WIDTH + BORDER_WIDTH) {
                patches[index] = new Patch(papplet, w, h, PATCH_WIDTH, PATCH_HEIGHT, color(0,0,0));
                index++;
            }
        }
    }
    
    void draw() {
        for (Patch p : patches) {
            p.draw();
        }
        // ! https://processing.org/examples/keyboard.html
        // handle keyboard input
    }
}