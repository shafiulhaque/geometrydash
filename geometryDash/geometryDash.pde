static Chars character;
static Block block;
static Block block1;
static Block block2;

//static Triangle tri;
static boolean entered;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  block = new Block(800, 420);
  block1 = new Block(830, 420);
  block2 = new Block(860, 420);
  //tri = new Triangle(1200, 450);
  entered = false;
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  rect(0, height * .75, width, height * .25);
  character.move();
  character.dead(block);
  if (!character.dead) character.display();
  block.place();
  block1.place();
  block2.place();
  //tri.place();
  if (entered) popUp();
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
      if (character.y == height * .75 - character.sideL && !character.dead) {
        character.jump();
      }
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
