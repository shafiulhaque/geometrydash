public class SlantTriangle extends Block {

  public SlantTriangle(float x0, float y0) {
    super(x0, y0+20);
    isSafeTop = false;
    isEmpty = false;
  }

  void place(PImage img) {
    stroke(255);
    fill(0);
    triangle(x+sideL/2, y, x, y+10, x+sideL, y+10);
    x -= 6;
  }
}
