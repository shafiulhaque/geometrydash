public class Chars {
  boolean dead;
  float x, y;
  float dx, dy;
  color c;
  boolean jump;
  float sideL;

  public Chars() {
    dead = true;
    sideL = 30;
    x = 0;
    y = (height * .75) - sideL;
    dx = 0;
    dy = 0;
  }
}
