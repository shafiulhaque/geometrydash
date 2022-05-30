public class Spike extends Chars {
  void display() {
    if (!dead) {
      stroke(220); 
      fill(100, 140, 220);
      circle(x+sideL/2, y+sideL/2, sideL);
      fill(0, 0, 128);
      circle(x+sideL/2, y+sideL/2, sideL/2);
    }
  }
}
