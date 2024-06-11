/**
* The Patch class represents a rectangular patch with various properties and behaviors.
*/
public class Patch {
    private color c = color(0); // The color of the patch
    private int x; // The x-coordinate of the patch
    private int w; // The width of the patch
    private int h; // The height of the patch
    private int y; // The y-coordinate of the patch
    private int level = 0; // The level of the patch
    private int rounding = 10; // The rounding of the patch's corners
    private color textColor = color(0); // The color of the text displayed on the patch
    private boolean showText = false; // Indicates whether the text should be displayed on the patch
    private boolean anchored = false; // Indicates whether the patch is anchored
    
    private PApplet applet; // The PApplet instance
    private String value = ""; // The value associated with the patch
    private boolean stroke = false; // Indicates whether the patch has a stroke
    
    /**
    * Constructs a Patch object with the specified parameters.
    * 
    * @param applet the PApplet instance
    * @param x the x-coordinate of the patch
    * @param y the y-coordinate of the patch
    * @param w the width of the patch
    * @param h the height of the patch
    * @param c the color of the patch
    * @param rounding the rounding of the patch's corners
    * @param stroke indicates whether the patch has a stroke
    * @param textColor the color of the text displayed on the patch
    */
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
    
    /**
    * Constructs a Patch object with the specified parameters.
    * 
    * @param applet the PApplet instance
    * @param x the x-coordinate of the patch
    * @param y the y-coordinate of the patch
    * @param w the width of the patch
    * @param h the height of the patch
    * @param level the level of the patch
    * @param c the color of the patch
    */
    public Patch(PApplet applet, int x, int y, int w, int h, int level, color c) {
        this.applet = applet;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
        this.level = level;
    }
    
    /**
    * Toggles the display of the text on the patch.
    * 
    * @return the updated Patch object
    */
    public Patch toggleText() {
        showText = !showText;
        return this;
    }
    
    /**
    * Checks if the text is currently being displayed on the patch.
    * 
    * @return true if the text is being displayed, false otherwise
    */
    public boolean isShowingText() {
        return showText;
    }
    
    /**
    * Gets the level of the patch.
    * 
    * @return the level of the patch
    */
    public int getLevel() {
        return level;
    }
    
    /**
    * Anchors the patch.
    * 
    * @return the updated Patch object
    */
    public Patch anchor() {
        anchored = true;
        return this;
    }
    
    /**
    * Sets the level of the patch.
    * 
    * @param level the new level of the patch
    * @return the updated Patch object
    */
    public Patch setLevel(int level) {
        this.level = level;
        return this;
    }
    
    /**
    * Draws the patch on the screen.
    */
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
            applet.text(value, x + w / 2, y + h / 2);
        }
    }
    
    /**
    * Gets the value associated with the patch.
    * 
    * @return the value associated with the patch
    */
    public String getValue() {
        return value;
    }
    
    /**
    * Sets the value associated with the patch.
    * 
    * @param value the new value to be associated with the patch
    * @return the updated Patch object
    */
    public Patch setValue(String value) {
        this.value = value;
        return this;
    }
    
    /**
    * Gets the x-coordinate of the patch.
    * 
    * @return the x-coordinate of the patch
    */
    public int getX() {
        return x;
    }
    
    /**
    * Gets the y-coordinate of the patch.
    * 
    * @return the y-coordinate of the patch
    */
    public int getY() {
        return y;
    }
    
    /**
    * Gets the color of the patch.
    * 
    * @return the color of the patch
    */
    public color getColor() {
        return c;
    }
    
    /**
    * Sets the color of the patch.
    * 
    * @param newColor the new color for the patch
    * @return the updated Patch object
    */
    public Patch setColor(color newColor) {
        c = newColor;
        return this;
    }
}
