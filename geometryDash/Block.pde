public class Block {
  float x, y;
  int sideL;
  boolean isSafeSide;
  boolean isSafeTop;

  public Block(float x0, float y0, int sideL0, boolean safes, boolean safet) {
    x = x0;
    y = y0;
    sideL = sideL0;
    isSafeSide = safes;
    isSafeTop = safet;
  }

  public Block(float x0, float y0) {
    x = x0;
    y = y0;
    sideL = 30;
    isSafeSide = false;
    isSafeTop = true;
  }

  void place() {
    stroke(220);
    fill(220, 220, 220);
    rect(x, y, sideL, sideL);
    x -= 4;
  }

  boolean isSafeSide() {
    return isSafeSide;
  }

  boolean isSafeTop() {
    return isSafeTop;
  }
}
