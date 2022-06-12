public class Block {
  float x, y;
  int sideL;
  int sideW;
  boolean isSafeSide;
  boolean isSafeTop;
  String type;
  boolean isEmpty;
  color colr;
  int attempts;
  int jumps;

  public Block(float x0, float y0, int sideL0, boolean safes, boolean safet) {
    x = x0;
    y = y0;
    sideL = sideL0;
    sideW = sideL0;
    isSafeSide = safes;
    isSafeTop = safet;
    type = "block";
    isEmpty = false;
    colr = color(220, 220, 220);
  }

  public Block(float x0, float y0) {
    x = x0;
    y = y0;
    sideL = 30;
    isSafeSide = false;
    isSafeTop = true;
    type = "block";
    isEmpty = false;
    colr = 220;
  }

  void place(PImage img) {
    image(img, x, y);
    x -= 6;
  }

  boolean isSafeSide() {
    return isSafeSide;
  }

  boolean isSafeTop() {
    return isSafeTop;
  }

  String type() {
    return type;
  }
}
