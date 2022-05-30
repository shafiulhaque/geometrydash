public class Portal extends Block{
  
  public Portal(float x0, float y0, String t){
    super(x0, y0);
    isSafeSide = true;
    isSafeTop = true;
    sideW = 100;
    sideL = 50;
    type = t;
  }
  void place(){
    rect(x, y, sideL, sideW);
    fill(159, 43, 104);
    rect(x, y, sideL/3, sideW);
    x -= 7;
  }
}
