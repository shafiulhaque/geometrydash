public class Chars {
  boolean dead;
  float x, y;
  float dx, dy;
  color c;
  boolean jump;
  float sideL;

  public Chars() {
    dead = true;
    sideL = 30;
    x = 0;
    y = (height * .75) - sideL;
    dx = 0;
    dy = 0;
  }
  
  void move(){
    x += dx;
    y += dy;
    if(y != height * .75 - sideL){
      dy += 3.5;
    }
    else{
      dy = 0;
    }
  }
  
  void jump(){
    dy -= 35;
  }
  
  
}
