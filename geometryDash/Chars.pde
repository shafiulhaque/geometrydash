public class Chars {
  boolean dead;
  float x, y;
  float dx, dy;
  color c;
  boolean jump;
  float sideL;

  public Chars() {
    dead = false;
    sideL = 30;
    x = 30;
    y = (height * .75) - sideL;
    dx = 0;
    dy = 0;
  }

  void move() {
    if (!dead) {
      x += dx;
      y += dy;
      if (y != height * .75 - sideL) {
        dy += 3;
      } else {
        dy = 0;
      }
    }
  }

  void jump() {
    dy -= 30;
  }

  void display() {
    fill(100, 140, 220);
    rect(x, y, sideL, sideL);
  }

  boolean dead(Block other) {
    return true;
  }
}
