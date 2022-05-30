public class Portal extends Block {

  public Portal(float x0, float y0, String t) {
    super(x0, y0);
    isSafeSide = true;
    isSafeTop = true;
    sideW = 100;
    sideL = 50;
    type = t;
  }
  void place() {
    fill(0);
    rect(x, y, sideL, sideW);
    fill(159, 43, 104);
    rect(x, y, sideL/3, sideW);
    fill(173, 216, 230);
    rect(x+ 44, y, sideL/5, sideW);
    x -= 7;
  }
}
