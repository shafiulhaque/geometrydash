static Chars character;
static Block block;
static Block block1;
static Block block2;
static Triangle tri;
static Triangle tri2;
static Slab slab;
static boolean entered;
static Levels level1;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  level1 = new Levels("level1.txt");
  //block = new Block(800, 420);
  //block1 = new Block(800, 390);
  //block2 = new Block(860, 420);
  //tri = new Triangle(1200, 420);
  //tri2 = new Triangle(1170, 420);
  //slab = new Slab(1250, 420);
  entered = false;
}

void draw() {
  //delay(20);
  if (!entered){
  background(255);
  noStroke();
  fill(0);
  rect(0, height * .75, width, height * .25);
  level1.display();
  //character.dead(block);
  //character.dead(block1);
  //character.dead(block2);
  //character.dead(tri);
  //character.dead(tri2);
  //character.dead(slab);
  character.move();
  if (!character.dead) character.display();
  //block1.place();
  //block.place();
  //block2.place();
  //tri.place();
  //tri2.place();
  //slab.place();
  } else {
    popUp();
  }
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
      if (character.y == character.platform && !character.dead) {
        character.jump();
      }
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
