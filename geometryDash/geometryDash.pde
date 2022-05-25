static Chars character;
static Block block;
//static Triangle tri;
static boolean entered;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  block = new Block(575, 450);
  //tri = new Triangle(300, 450);
  entered = false;
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  rect(0, height * .75, width, height * .25);
  character.move();
  character.display();
  block.place();
  //tri.place();
  if(entered) popUp();
}

void popUp() {
  if (entered) {
    stroke(220);
    fill(130);
    rect(width * .15, height * .15, width * .7, height * .7);
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("GAME IS PAUSED", width * .5, height * .3);
    textSize(20);
    text("PRESS ENTER TO RESUME", width * .5, height * .5);
  }
}


void keyPressed() {
  if (keyCode == 32) {
    if (!entered) {
      if (character.y == height * .75 - character.sideL) {
        character.jump();
      }
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
