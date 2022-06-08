public class emptyBlock extends Block {

  public emptyBlock(float x0, float y0) {
    super(x0, y0);
    isSafeTop = true;
    isSafeSide = true;
    isEmpty = true;
  }

  void place(PImage img) {
    x -= 6;
  }

}
