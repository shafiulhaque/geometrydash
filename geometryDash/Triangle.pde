public class Triangle extends Block {

  public Triangle(float x0, float y0, String dir) {
    super(x0, y0);
    isSafeTop = false;
    isEmpty = false;
    type = dir;
  }

  void place() {
    stroke(255);
    fill(0);
    if (type.equals("up triangle")) triangle(x+sideL/2, y, x, y+sideL, x+sideL, y+sideL);
    if (type.equals("down triangle")) triangle(x+sideL/2, y+sideL, x, y, x+sideL, y);
    if (type.equals("left triangle")) triangle(x, y+sideL/2, x+sideL, y+sideL, x+sideL, y);
    x -= 6;
  }
}
