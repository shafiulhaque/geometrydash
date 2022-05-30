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
    dx = 3;
    dy = 0;
    platform = 420;
  }

  void move() {
    if (!dead) {
      x += dx;
      y += dy;
      if (y < platform) {
        dy += 3;
      } else {
        dy = 0;
      }
      if (x == 270) {
        dx = 0;
      }
      //if (y > platform) {
      //  y = platform;
      //}
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
    //text(y, 20, 20);
    //text(dy, 20, 40);
    //text(x, 20, 60);
    //text(dx, 20, 80);
    //text(other.x, 20, 100);
    //text(other.y, 20, 120);
    //text(platform, 20, 140);

    if (!dead) {
      if ((x > other.x && x < other.x + sideL) && other.isSafeTop) {
        if (y + sideL <= other.y) {
          platform = other.y - sideL;
        } else if (y >= other.y && y < other.y + sideL) { 
          dead = true;
        }
      } else if ((x == other.x) && other.isSafeTop) {
        if (y + sideL <= other.y) {
          platform = other.y - sideL;
        } else if (y >= other.y && y < other.y + sideL) {
          dead = true;
        }
      } else if ((x + sideL > other.x && x + sideL < other.x + sideL) && other.isSafeTop) {
        if (y + sideL <= other.y) {
          platform = other.y - sideL;
        } else if (y >= other.y && y < other.y + sideL) {
          dead = true;
        }
      }
    }
  }
}
