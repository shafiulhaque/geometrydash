public class Chars { //<>//
  boolean dead;
  float x, y;
  float dx, dy;
  color c;
  float sideL;
  float platform;

  public Chars() {
    dead = false;
    sideL = 30;
    x = 0;
    y = 420;
    dx = 6;
    dy = 0;
    platform = 420;
  }

  void move() {
    if (!dead) {
      if (x == 270) {
        dx = 0;
      }
      x += dx;
      y += dy;
      if (y < platform) {
        dy += 3;
      } else {
        dy = 0;
      }
      if (y > platform) {
        y = platform;
      }
    }
  }

  void jump() {
    dy -= 30;
  }

  void display() {
    if (!dead) {
      stroke(220); 
      fill(100, 140, 220);
      rect(x, y, sideL, sideL);
    }
  }

  void dead(Block other) {
    if (!dead) {
      if ((x >= other.x && x < other.x + sideL) && other.isSafeTop) {
        if (y + sideL <= other.y) {
          platform = other.y - sideL;
        } else if (y + sideL > other.y && y + sideL <= other.y + sideL) { 
          dead = true;
        } else if ((y >= other.y && y < other.y + sideL)) {
          dead = true;
        }
      } else if ((x + sideL >= other.x && x + sideL < other.x + sideL) && other.isSafeTop) {
        if (y + sideL <= other.y) {
          platform = other.y - sideL;
        } else if (y + sideL > other.y && y + sideL <= other.y + sideL) {
          dead = true;
        } else if ((y >= other.y && y < other.y + sideL)) {
          dead = true;
        }
      }
      else if (!other.isSafeTop) {
        if (abs(x + (sideL / 2) - other.x) <= 15 && (y + sideL >= other.y && y + sideL <= other.y + sideL)) dead = true;
        else if ((x > other.x + sideL / 2 && x <= other.x + sideL)  && (y + sideL > other.y)) dead = true;
      }
    }
  }
}
