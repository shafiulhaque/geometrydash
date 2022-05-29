public class UFO extends Chars {
  float setb;
  float sett;
  public UFO() {
    super();
    dy = 10;
    setb = 420;
    sett = 50;
  }

  void move() {
    if (!dead) {
      x += dx;
      y += dy;
    }
    if (x == 270) {
      dx = 0;
    }
    if (y == platform) {
      dy = 0;
    } else {
      dy += 2;
    }
    if (y > setb){
      y = setb;
    }
    if (y < sett){
      y = sett;
    }
  }

  void jump() {
    dy = -20;
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
    return "ROCKET";
  }
}
