public class levelsMenu{
  int x, y;
  int dx, dy;
  color col;
  String levelName;
  
  public levelsMenu(){
    x = 50;
    y = 50;
    dx = 0;
    dy = 0;
    col = 255;
    levelName = "tutorial";
  }
  
  public levelsMenu(int xC, int yC, color c, String name ){
    x = xC;
    y = yC;
    dx = 0;
    dy = 0;
    col = c;
    levelName = name;
  }
  
  void display(int sideX, int sideY){
    fill(col);
    rect(x, y, sideX, sideY);
    fill(col + 50);
    rect(x + 100, y + 100, sideX - 200, sideY - 200);
    fill(255);
    ellipse(x + 400, 300, 50, 50);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("PLAY!", x + 400, 250);
    fill(0, 255, 0);
    triangle(x + 403 + (25 * (cos(PI / 6) / 2)), 300, x + 403 - (25 * (cos(PI / 6) / 2)), 300 + 12.5, x + 403 - (25 * (cos(PI / 6) / 2)), 300 - 12.5);
  }
  
  void move(){
    x += dx;
    if(x % 900 == 50 || x % 900 == -850) dx = 0;
  }
  
  void moveL(){
    dx = -50;
  }
  
  void moveR(){
    dx = 50;
  }
}
