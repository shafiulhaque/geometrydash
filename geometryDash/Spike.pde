public class Spike extends Chars {
  float setb;
  float sett;

  public Spike() {
    super();
    dy = 10;
    setb = 420;
    sett = 50;
    type = "SPIKE";
    top = 35;
  }

  public Spike(float x0, float y0) {
    super(x0, y0);
    dy = 10;
    setb = 420;
    sett = 50;
    type = "SPIKE";
    top = 35;
  }

  void move() {
    if (!dead) {
      x += dx;
      y += dy;
    }
    if (x >= 270) {
      x = 270;
      dx = 0;
    }
    if (y == platform) {
      dy = 0;
    } else {
      dy += 2;
    }
    if (y > setb) {
      y = setb;
    }
    if (y < sett) {
      y = sett;
    }
  }

  void jump() {
    dy = -18;
  }

  void display() {
    if (!dead) {
      stroke(220); 
      fill(100, 140, 220);
      circle(x+sideL/2, y+sideL/2, sideL);
      fill(0, 0, 128);
      circle(x+sideL/2, y+sideL/2, sideL/2);
    }
  }

  String type() {
    return type;
  }
}
