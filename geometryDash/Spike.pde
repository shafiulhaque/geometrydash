public class Spike extends Chars {
  float setb;
  float sett;
  boolean rev;

  public Spike() {
    super();
    dy = 15;
    setb = 420;
    sett = 50;
    type = "SPIKE";
    top = 50;
  }

  public Spike(float x0, float y0) {
    super(x0, y0);
    dy = 15;
    setb = 420;
    sett = 50;
    type = "SPIKE";
    top = 50;
  }

  void move() {
    if (!dead) {
      x += dx;
      y += dy;
      if (x >= 270) {
        x = 270;
        dx = 0;
      }
      setb = platb;
      if (y > setb) {
        y = setb;
      }
      if (y < sett) {
        y = sett;
      }
    }
  }

  void jump(boolean jump) {
    if (jump && rev){
      dy = -dy;
      rev = false;
    }
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
