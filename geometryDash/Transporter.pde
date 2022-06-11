public class Transporter extends Block {
  public Transporter(float x0, float y0, String t) {
    super(x0, y0+25);
    isSafeSide = true;
    isSafeTop = true;
    sideW = 5;
    sideL = 30;
    type = t;
  }
  void place() {
    stroke(220);
    fill(220, 220, 0);
    rect(x, y, sideL, sideW);
    x -= 6;
  }
}
