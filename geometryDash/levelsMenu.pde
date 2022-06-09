public class levelsMenu{
  int x, y;
  int dx, dy;
  color col;
  String levelName;

  public levelsMenu(color c, String name ){
    x = 50;
    y = 50;
    dx = 0;
    dy = 0;
    col = c;
    levelName = name;
  }
  
  void display(int sideX, int sideY){
    fill(col);
    rect(x, y, sideX, sideY);
    fill(255);
    ellipse(450, 300, 50, 50);
    fill(0, 255, 0);
    triangle(453 + (25 * (cos(PI / 6) / 2)), 300, 453 - (25 * (cos(PI / 6) / 2)), 300 + 12.5, 453 - (25 * (cos(PI / 6) / 2)), 300 - 12.5) ;
  }
}
