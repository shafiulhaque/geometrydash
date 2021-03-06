public class levelsMenu {
  int x, y;
  int dx, dy;
  color col;
  String levelName;

  public levelsMenu() {
    x = 50;
    y = 50;
    dx = 0;
    dy = 0;
    col = 255;
    levelName = "tutorial";
  }

  public levelsMenu(int xC, int yC, color c, String name ) {
    x = xC;
    y = yC;
    dx = 0;
    dy = 0;
    col = c;
    levelName = name;
  }

  void display(int sideX, int sideY) {
    if (levelName.equals("tutorial")) {
      fill(col);
      rect(x - 50, y - 50, sideX, sideY);
      fill(0);
      textSize(20);
      textAlign(LEFT);
      text("Level Menu Controls: ", x + 70, 120);
      text("LEFT ARROW: MOVE TO THE PREVIOUS LEVEL SCREEN", x + 70, 160);
      text("RIGHT ARROW: MOVE TO THE NEXT LEVEL SCREEN", x + 70, 200);
      text("Game Controls: ", x + 70, 270);
      text("SPACEBAR: JUMP", x + 70, 310);
      text("ENTER/RETURN: PAUSE", x + 70, 350);
      text("CLICK LEFT BUTTON: RESTART/RESUME", x + 70, 390);
      text("CLICK RIGHT BUTTON: RETURN TO MENU", x + 70, 430);
    } else {
      fill(col);
      rect(x - 50, y - 50, sideX, sideY);
      fill(0, 0, 0, 100);
      rect(x + 100, y + 25, sideX - 300, sideY - 300);
      fill(255);
      ellipse(x + 400, 300, 50, 50);
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text("PLAY!", x + 400, 190);
      fill(0, 255, 0);
      triangle(x + 403 + (25 * (cos(PI / 6) / 2)), 300, x + 403 - (25 * (cos(PI / 6) / 2)), 300 + 12.5, x + 403 - (25 * (cos(PI / 6) / 2)), 300 - 12.5);
    }
  }

  void move() {
    x += dx;
    if (x % 900 == 50 || x % 900 == -850) dx = 0;
  }

  void arrR() {
    dx = -50;
  }

  void arrL() {
    dx = 50;
  }
}
