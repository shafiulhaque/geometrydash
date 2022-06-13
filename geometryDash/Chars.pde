public class Chars { //<>//
  boolean dead;
  float x, y;
  float dx, dy;
  color c;
  float sideL;
  float platform;
  boolean change;
  String type;
  float top;
  float platb;
  float platf;
  float platub;
  float platuf;
  float platformu;

  public Chars() {
    dead = false;
    sideL = 30;
    x = 0;
    y = 420;
    dx = 6;
    dy = 0;
    platform = 420;
    change = false;
    type = "BLOCK";
    top = 0;
    platb = 420;
    platf = 420;
    platformu = 0;
    platub = 0;
    platuf = 0;
  }

  public Chars(float x0, float y0) {
    dead = false;
    sideL = 30;
    x = x0;
    y = y0;
    dx = 6;
    dy = 0;
    platform = 420;
    platformu = 0;
    change = false;
    type = "BLOCK";
    top = 0;
    platb = 420;
    platf = 420;
    platub = 0;
    platuf = 0;
  }

  void move() {
    if (!dead) {
      if (x == 270) {
        dx = 0;
      }
      x += dx;
      y += dy;
      if (y < platb) {
        dy += 1;
      } else {
        dy = 0;
      }
      if (y >= platform) {
        y = platform;
        dy = 0;
      }
    }
  }

  void jump(boolean jump) {
    if (jump && (character.y == character.platf || character.y == character.platb) && !character.dead && character.dy == 0.0) {
      dy -= 12;
    }
  }

  void display(PImage[] img) {
    if (!dead) {
      if (type.equals("BLOCK")) {
        image(img[0], x, y);
      }
      if (type.equals("ROCKET")) {
        image(img[1], x, y);
        image(img[3], x+15, y);
      }
      if (type.equals("UFO")) {
        image(img[2], x, y+4);
        image(img[3], x+10, y);
      }
    }
  }

  void dead(Block other) {
    if (!dead) {
      if (!(other.isSafeTop() && other.isSafeSide())) {

        if (other.y < y - sideL) {
          dead = false;
        } 

        if (x+sideL >= other.x && x+sideL < other.x + sideL && y >= other.y && y < other.y + sideL) {
          dead = true;
        } else if (x >= other.x && x < other.x + sideL && y >= other.y && y < other.y + sideL) {
          dead = true;
        } else if (x+sideL > other.x && x+sideL < other.x + sideL && y+sideL > other.y && y+sideL < other.y + sideL) {
          dead = true;
        } else if (x > other.x && x < other.x + sideL && y+sideL > other.y && y+sideL < other.y + sideL) {
          dead = true;
        } 

        if (other.isSafeTop()) {

          if ((y >= other.y - sideL) && ((x+sideL > other.x && x+sideL < other.x + sideL && y+sideL > other.y && y+sideL < other.y + sideL))) {
            y = other.y-sideL;
          }

          if (y <= other.y && ((x + sideL > other.x && x + sideL < other.x + sideL) || (x > other.x && x < other.x + sideL))) {
            dead = false;
            platform = other.y - sideL;
          }


          if (y >= other.y && ((x + sideL > other.x && x + sideL < other.x + sideL) || (x > other.x && x < other.x + sideL))) {
            dead = false;
            if (platformu < other.y - sideL) platformu = other.y + sideL;
          }
        }
      } else {

        if (x+sideL > other.x && x+sideL < other.x+other.sideL && y > other.y && y < other.y+other.sideW) {
          change = true;
          type = other.type;
        }

        if (other.type.equals("MID") && (x > other.x && x < other.x+other.sideL || x+sideL > other.x && x+sideL < other.x+other.sideL) && y+sideL >= other.y && y+sideL <= other.y+other.sideW) {
          dy = -16;
        }
      }
    }
  }

  float platInt(Block other) {
    if (other.isSafeTop()) {
      if (y + sideL <= other.y) {
        return other.y - sideL;
      }
    }
    return 600;
  }

  float platIntUp(Block other) {
    if (other.isSafeTop()) {
      if (y > other.y - sideL) {
        return other.y + sideL;
      }
    }
    return 30;
  }


  String type() {
    return type;
  }
}
