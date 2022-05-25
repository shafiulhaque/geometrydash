public class Triangle extends Block {
  public Triangle(float x0, float y0) {
    super(x0, y0);
  }
  void place() {
    fill(220, 220, 220);
    triangle(x-sideL+sideL/2, y-sideL, x-sideL, y, x, y);
    x -= 4;
  }
}
