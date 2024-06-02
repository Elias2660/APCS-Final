public class Patch {

    // may need to add rounding later
    private color c;
    private int x;  
    private int w; 
    private int h;
    private int y;
    private int level;
    private int rounding = 10;

    private boolean showText = false;
    
    private PApplet applet;
    private int value;
    private boolean stroke = false;

    public Patch(PApplet applet, int x, int y, int w, int h, color c, float rounding, boolean stroke) {
        this.applet = applet;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
        this.rounding = (int) rounding;
        value = 0;
        this.stroke = stroke;
    }

    public Patch(PApplet applet, int x, int y, int w, int h, int level, color c) {
        this.applet = applet;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
        this.level = level;
    }


    public void toggleText() {
        showText = !showText;
    }

    public int getLevel() {
        return level;
    }

    public int setLevel(int level) {
        return this.level = level;
    }
    
    void draw() {
        //When working in colorMode(RGB, 255), you can achieve the same results as red() but with greater speed by using the right shift operator (>>) with a bit mask
        stroke(red(c), green(c), blue(c));
        fill(red(c), green(c), blue(c));
        if (stroke) {
            applet.stroke(color(58,58,60));
            applet.strokeWeight(3);
        }
        applet.rect(x, y, w, h, rounding);

        if (showText) {
            applet.fill(0);
            applet.textSize(20);
            applet.text(value, x + w/2, y + h/2);
        }
    }
    
    public int getValue() {
        return value;
    }
    
    public void setValue(int value) {
        this.value = value;
    }
    
    public int getX() {
        return x;
    }
    
    public int getY() {
        return y;
    }
    
    public color getColor() {
        return c;
    }
    
    public void setColor(color newColor) {
        c = newColor;
    }
}