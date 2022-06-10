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
    text("Level Menu Controls: ", 120, 120);
    text("LEFT ARROW: MOVE TO THE PREVIOUS LEVEL SCREEN", 120, 160);
    text("RIGHT ARROW: MOVE TO THE NEXT LEVEL SCREEN", 120, 200);
    text("Game Controls: ", 120, 270);
    text("SPACEBAR: JUMP", 120, 310);
    text("ENTER/RETURN: PAUSE", 120, 350);
    text("ENTER/RETURN + N: RETURN TO MENU", 120, 390);
    text("R: RESPAWN", 120, 430);
    text("A: TOGGLE AUTO-RESPAWN", 120, 470);
  }
}
