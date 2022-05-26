public class Block {
  float x, y;
  int sideL;
  boolean isSafe;
  color col;

  public Block(float x0, float y0, int sideL0, boolean safe) {
    x = x0;
    y = y0;
    sideL = sideL0;
    isSafe = safe;
  }

  public Block(float x0, float y0) {
    x = x0;
    y = y0;
    sideL = 30;
    isSafe = true;
    col = 220;
  }

  void place() {
    fill(col);
    rect(x-sideL, y-sideL, sideL, sideL);
    x -= 4;
  }
  

  boolean isSafe() {
    return isSafe;
  }
}
