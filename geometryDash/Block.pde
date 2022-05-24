float x, y;
int sideL;
boolean isSafe;

public class Block {
  public Block(float x0, float y0, int sideL0, boolean safe){
    x = x0;
    y = y0;
    sideL = sideL0;
    isSafe = safe;
  }
  public Block(float x0, float y0){
    x = x0;
    y = y0;
    sideL = 30;
    isSafe = true;
  }
  void place(){
    fill(220, 220, 220);
    rect(x, y, sideL, sideL);
  }
}
