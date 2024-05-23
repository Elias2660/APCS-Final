public class Patch {
    color c;
    int x; 
    int y;
    int value;
    public Patch(int x, int y, int value, color c) {
        this.x = x;
        this.y = y;
        this.c = c;
        this.value = value;
    }
    
    public Patch(int x, int y, color c) {
        this.x = x;
        this.y = y;
        this.c = c;
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