public class Patch {

    // may need to add rounding later
    private color c = color(0);
    private int x;  
    private int w; 
    private int h;
    private int y;
    private int level = 0;
    private int rounding = 10;
    private color textColor = color(0); 
    private boolean showText = false;
    private boolean anchored = false;
    
    private PApplet applet;
    private String value = ""; // Changed data type to String
    private boolean stroke = false;

    public Patch(PApplet applet, int x, int y, int w, int h, color c, float rounding, boolean stroke, color textColor) {
        this.applet = applet;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
        this.rounding = (int) rounding;
        value = "0"; // Initialize with a string value
        this.stroke = stroke;
        this.textColor = textColor;
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


    public Patch toggleText() {
        showText = !showText;
        return this;
    }

    public boolean isShowingText() {
        return showText;
    }

    public int getLevel() {
        return level;
    }

    public Patch anchor() {
        anchored = true;
        return this;
    }

    public int setLevel(int level) {
        return this.level = level;
    }
    
    void draw() {
        //When working in colorMode(RGB, 255), you can achieve the same results as red() but with greater speed by using the right shift operator (>>) with a bit mask
        stroke(red(c), green(c), blue(c));
        fill(red(c), green(c), blue(c));
        if (stroke) {
            applet.stroke(c);
            applet.strokeWeight(3);
        }
        applet.rect(x, y, w, h, rounding);

        if (showText || anchored) {
            applet.fill(textColor);
            applet.textSize(20);
            applet.text(value, x + w/2, y + h/2);
        }
    }
    
    public String getValue() { // Changed return type to String
        return value;
    }
    
    public Patch setValue(String value) { // Changed parameter type to String
        this.value = value;
        return this;
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