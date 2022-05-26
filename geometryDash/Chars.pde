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
    x = 0;
    y = (height * .75) - sideL;
    dx = 3;
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
      if (x == 270){
        dx = 0;
      }
    }
  }

  void jump() {
    dy -= 21;
  }

  void display() {
    fill(100, 140, 220);
    rect(x, y, sideL, sideL);
  }

  boolean dead(Block other) {
    if(other.x - x < sideL && other.y - y < sideL){
      return true;
    }
    return false;
  }
}
