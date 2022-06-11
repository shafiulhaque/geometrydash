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
    textSize(20);
    textAlign(LEFT);
    text("Level Menu Controls: ", x + 70, 120);
    text("LEFT ARROW: MOVE TO THE PREVIOUS LEVEL SCREEN", x + 70, 160);
    text("RIGHT ARROW: MOVE TO THE NEXT LEVEL SCREEN", x + 70, 200);
    text("Game Controls: ", x + 70, 270);
    text("SPACEBAR: JUMP", x + 70, 310);
    text("ENTER/RETURN: PAUSE", x + 70, 350);
    text("ENTER/RETURN + N: RETURN TO MENU", x + 70, 390);
    text("R: RESPAWN", x + 70, 430);
    text("A: TOGGLE AUTO-RESPAWN", x + 70, 470);
  }
  
  void move(){
    x += dx;
    if(x % 900 == 50 || x % 900 == -850) dx = 0;
  }
  
  void arrL(){
    dx = -50;
  }
  
  void arrR(){
    dx = 50;
  }
}
