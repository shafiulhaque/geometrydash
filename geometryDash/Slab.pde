public class Slab extends Block {
  
  public Slab(float x0, float y0) {
    super(x0, y0);
    sideW = 10;
    sideL = 30;
    isEmpty = false;
  }

  void place() {
    stroke(220);
    fill(220, 220, 220);
    rect(x, y, sideL, sideW);
    x -= 6;
  }
  
}
