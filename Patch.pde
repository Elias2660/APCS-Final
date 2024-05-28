public class Patch {
    color c;
    int x; 
    int w;
    int h;
    int y;
    PApplet applet;
    int value;
    public Patch(PApplet applet, int x, int y, int w, int h, int value, color c) {
        this.applet = applet;
        this.x = x;
        this.y = y;
        this.c = c;
        this.w = w;
        this.h = h;
        this.value = value;
        // println(c);
    }
    
    public Patch(PApplet applet, int x, int y, int w, int h, color c) {
        this.applet = applet;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
        // println(c);
    }
    
    void draw() {
        //When working in colorMode(RGB, 255), you can achieve the same results as red() but with greater speed by using the right shift operator (>>) with a bit mask
        // ! finish work
        stroke(red(c), green(c), blue(c));
        fill(red(c), green(c), blue(c));
        applet.rect(x, y, w, h, 10);
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