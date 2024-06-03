import java.util.Arrays;
public class Wordle {
    private Patch[] patches;
    private PApplet papplet;
    private int currentRow = 0;
    
    public Wordle(PApplet papplet) {
        this.papplet = papplet;
        papplet.background(color(18,18,19));
        // 5 x 6 board
        // so with each path being 30 x 30
        int PATCH_WIDTH = 80;
        int PATCH_HEIGHT = 80;
        int BORDER_WIDTH = 10;
        int WIDTH = PATCH_WIDTH * 5 + BORDER_WIDTH * 6;
        int HEIGHT = PATCH_HEIGHT * 6 + BORDER_WIDTH * 7;
        
        
        windowResize(WIDTH, HEIGHT);
        patches = new Patch[30];
        int index = 0;
        
        for (int h = BORDER_WIDTH; h + PATCH_HEIGHT + BORDER_WIDTH <= HEIGHT; h += PATCH_HEIGHT + BORDER_WIDTH) {
            for (int w = BORDER_WIDTH; w + PATCH_WIDTH + BORDER_WIDTH <= WIDTH; w += PATCH_WIDTH + BORDER_WIDTH) {
                System.out.println("w: " + w + " h: " + h);
                Patch p = new Patch(papplet, w, h, PATCH_WIDTH, PATCH_HEIGHT, color(18,18,19), 0.0, true);
                patches[index] = p;
                index++;
            }
        }
    }
    
    public void draw() {
        for (Patch p : patches) {
            if (p != null) {
                p.draw();
            }
        }
    }
    
    private boolean isWordValid(String word) {
        return true;
    }
    
    private String CharArrayToWord(char[]  word) {
        String str = "";
        for (char c : word) {
            str += c;
        }
        return str;
    }
    
    private char[] WordToCharArray(String word) {
        return word.toCharArray();
    }
}