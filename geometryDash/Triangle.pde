public class Triangle extends Block {

  public Triangle(float x0, float y0) {
    super(x0, y0);
    isSafeTop = false;
    isEmpty = false;
  }

  void place(PImage img) {
    stroke(255);
    fill(0);
    triangle(x+sideL/2, y, x, y+sideL, x+sideL, y+sideL);
    x -= 6;
  }
}
