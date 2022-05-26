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
    y = 420;
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
    stroke(220); 
    fill(100, 140, 220);
    rect(x, y, sideL, sideL);
  }

  boolean dead(Block other) {
    text(other.x - x, 20, 20);
    text(other.y - y, 20, 40);
    text(x, 20, 60);
    text(y, 20, 80);
    text(other.x, 20, 100);
    text(other.y, 20, 120);
    stroke(225, 0, 0);
    line(other.x, other.y, x, y);
    if(other.x - x < sideL && other.y - y < sideL){
      return true;
    }
    return false;
  }
}
