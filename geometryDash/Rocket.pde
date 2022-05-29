public class Rocket extends Chars {
  public Rocket() {
    super();
  }
  void place() {
    if (!dead) {
      x += dx;
      y += dy;
    }
    if (x == 270) {
      dx = 0;
    }
  }
}
