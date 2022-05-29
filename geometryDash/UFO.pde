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
      fill(173, 216, 230);
      arc(x+sideL/2, y+sideL/2 - 3, 50, 50, PI, 2*PI);
      fill(68, 85, 90);
      quad(x-10, y+10, x, y+sideL, x+sideL, y+sideL, x+sideL+10, y+10);
      fill(100, 140, 220);
      rect(x+6, y-3, 3*sideL/5, 3*sideL/5 - 5);
    }
  }

  String type() {
    return "UFO";
  }
}
