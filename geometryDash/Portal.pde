public class Portal extends Block{
  PImage img;
  public Portal(float x0, float y0){
    super(x0, y0);
    isSafeSide = true;
    isSafeTop = true;
    sideW = 50;
    sideL = 100;
  }
  void place(){
    rect(x, y, sideW, sideL);
    fill(159, 43, 104);
    rect(x, y, sideW/3, sideL);
    x -= 7;
  }
}
