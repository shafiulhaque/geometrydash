public class Rocket extends Chars {
  float setb;
  float sett;

  public Rocket() {
    super();
    dy = 0;
    setb = 420;
    sett = 50;
    type = "ROCKET";
    top = 43;
  }

  public Rocket(float x0, float y0) {
    super(x0, y0);
    dy = 0;
    setb = 420;
    sett = 50;
    type = "ROCKET";
    top = 43;
  }

  void move() {
    if (!dead) {
      x += dx;
      y += dy;
    }
    setb = platform;
    sett = platformu;
    if (x >= 270) {
      x = 270;
      dx = 0;
    }
    if (y > setb) {
      y = setb;
      dy = 0;
    }
    if (y < sett) {
      y = sett;
      dy = 0;
    }
  }

  void jump(boolean jump) {
    if (jump) {
      if (dy != 7) dy -= 0.5;
    } else {
      if (dy != -7) dy += 0.3;
    }
    dy += 0.05;
    if (dy > 10) dy = 10;
    if (dy < -10) dy = -10;
  }

  void display() {
    if (!dead) {
      stroke(220); 
      fill(100, 140, 220);
      quad(x - 10, y, x-10, y+sideL, x, y +sideL - 10, x, y + 10);
      rect(x+6, y-5, 3*sideL/5, 3*sideL/5);
      rect(x, y+7, sideL, sideL/2);
      quad(x+sideL, y+5, x+sideL, y+sideL-5, x+sideL+5, y +sideL - 10, x+sideL+5, y + 10);
      fill(255, 165, 0);
      stroke(255, 165, 0); 
      rect(x-15, y+7, 5, sideL/2);
    }
  }

  String type() {
    return type;
  }
}
