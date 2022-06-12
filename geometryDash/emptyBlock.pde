public class emptyBlock extends Block {

  public emptyBlock(float x0, float y0, String t) {
    super(x0, y0);
    isSafeTop = true;
    isSafeSide = true;
    isEmpty = true;
    type = t;
  }

  void place(PImage img) {
    if (type.equals("black")) {
      stroke(105, 105, 105);
      fill(105, 105, 105);
      rect(x, y, sideL, sideL);
    }
    x -= 6;
  }
}
