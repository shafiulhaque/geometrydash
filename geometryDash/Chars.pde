public class Chars {
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
    y = 200;
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
      if (y > platform) {
        y = platform;
      }
    }
  }

  void jump() {
    dy -= 21;
  }

  void display() {
    if (!dead) {
      stroke(220); 
      fill(100, 140, 220);
      rect(x, y, sideL, sideL);
    }
  }

  void dead(Block other) {
    text(y, 20, 20);
    text(dy, 20, 40);
    text(x, 20, 60);
    text(dx, 20, 80);
    text(other.x, 20, 100);
    text(other.y, 20, 120);
    text(platform, 20, 140);
    
    if (!dead) {
      float dist = dist(other.x, other.y, x, y);
      if (other.y < y - sideL) {
        dead = false;
      } else if (y > other.y && y <= other.y + sideL && dist < 42.4264069 && x < other.x) {
        dead = true;
      } else if (y == other.y && dist < sideL && x < other.x) {
        dead = true;
      }

      if (y < other.y && (x + sideL > other.x && x + sideL < other.x + sideL) || (x > other.x && x < other.x + sideL)) {
        dead = false;
        platform = other.y - sideL;
        text("OK", 50, 100);
        other.makeTop();
      }
      
    }
  }
}
