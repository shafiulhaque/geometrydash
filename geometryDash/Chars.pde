public class Chars { //<>// //<>//
  boolean dead;
  float x, y;
  float dx, dy;
  color c;
  float sideL;
  float platform;
  boolean change;
  String type;
  float top;

  public Chars() {
    dead = false;
    sideL = 30;
    x = 0;
    y = 420;
    dx = 6;
    dy = 0;
    platform = 420;
    change = false;
    type = "BLOCK";
    top = 0;
  }

  public Chars(float x0, float y0) {
    dead = false;
    sideL = 30;
    x = x0;
    y = y0;
    dx = 3;
    dy = 0;
    platform = 420;
    change = false;
    type = "BLOCK";
    top = 0;
  }

  void move() {
    if (!dead) {
      if (x == 270) {
        dx = 0;
      }
      x += dx;
      y += dy;
      if (y < platform) {
        dy += 1;
      } else {
        dy = 0;
      }
      if (y > platform) {
        y = platform;
      }
    }
  }

  void jump() {
    dy -= 12;
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
      if (!(other.isSafeTop() && other.isSafeSide())) {
        if (other.y < y - sideL) {
          dead = false;
        } else if (x+sideL >= other.x && x+sideL < other.x + sideL && y >= other.y && y < other.y + sideL) {
          dead = true;
        } else if (x >= other.x && x < other.x + sideL && y >= other.y && y < other.y + sideL) {
          dead = true;
        } else if (x+sideL >= other.x && x+sideL < other.x + sideL && y+sideL >= other.y && y+sideL < other.y + sideL) {
          dead = true;
        }
        if (other.isSafeTop()) {
          if (y < other.y && ((x + sideL > other.x && x + sideL < other.x + sideL) || (x > other.x && x < other.x + sideL))) {
            dead = false;
            platform = other.y - sideL;
          }
        }
        // else if (x >= other.x && x < other.x + sideL && y >= other.y && y < other.y + sideL) {
        //  dead = true;
        //}
      } else {
        if (x+sideL > other.x && x+sideL < other.x+other.sideL && y > other.y && y < other.y+other.sideW) {
          change = true;
          type = other.type;
        }
      }
    }
  }

  float platformInitial(Block other) {
    if (other.isSafeTop()) {
      if (y + sideL <= other.y) {
        return other.y - sideL;
      }
    }
    return y;
  }


  String type() {
    return type;
  }
}
