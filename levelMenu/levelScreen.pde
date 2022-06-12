public class levelScreen{
  int x, y;
  int dx, dy;
  color col;

  public levelScreen(color c){
    x = 50;
    y = 50;
    dx = 0;
    dy = 0;
    col = c;
  }
  
  void display(int sideX, int sideY){
    fill(col);
    rect(x, y, sideX, sideY);
  }
}
