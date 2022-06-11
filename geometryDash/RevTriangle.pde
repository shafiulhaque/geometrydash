public class RevTriangle extends Block {

  public RevTriangle(float x0, float y0) {
    super(x0, y0);
    isSafeTop = false;
    isEmpty = false;
  }

  void place() {
    stroke(255);
    fill(0);
    triangle(x+sideL/2, y+sideL, x, y, x+sideL, y);
    x -= 6;
  }
}
