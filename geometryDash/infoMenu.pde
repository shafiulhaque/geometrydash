public class infoMenu extends levelsMenu{
  int x, y;
  int dx, dy;
  color col;
  String levelName;

  public infoMenu(){
    x = 50;
    y = 50;
    dx = 0;
    dy = 0;
    col = 220;
    levelName = "tutorial";
  }
  
  void display(int sideX, int sideY){
    fill(col);
    rect(x, y, sideX, sideY);
    fill(0);
    text("HELP", 200, 200);
  }
}
