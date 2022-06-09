public class Slab extends Block {
  
  public Slab(float x0, float y0) {
    super(x0, y0);
    sideW = 10;
    isEmpty = false;
  }

  void place(PImage img) {
    stroke(255);
    fill(0);
    rect(x, y, sideL, sideW);
    x -= 6;
  }
  
}
