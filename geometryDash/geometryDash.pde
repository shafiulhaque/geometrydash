static Chars character;
static Portal joe;
static Block bruh;
static Block bruh2;
static boolean entered;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  joe = new Portal(400, 300);
  bruh = new Block(800, 390);
  bruh2 = new Block(830, 390);
  entered = false;
}

void draw() {
  //delay(20);
  if (!entered) {
    background(255);
    noStroke();
    fill(0);
    rect(0, height * .75, width, height * .25);
    character.move();
    joe.place();
    character.dead(bruh);
    character.dead(bruh2);
    bruh.place();
    bruh2.place();
    if (!character.dead) character.display();
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
      if (character.type().equals("ROCKET") && !character.dead){
        character.jump();
      }
      if (character.type().equals("UFO") && !character.dead){
        character.jump();
      }
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
