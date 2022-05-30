static Chars character;
static Portal joe;
static boolean entered;

void setup() {
  size(900, 600);
  background(255);
  character = new Rocket();
  joe = new Portal(800, 300, "SHIP");
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
    text(character.dy, 20, 20);
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
      if (character.type().equals("ROCKET") && !character.dead) {
        character.jump();
      }
      if (character.type().equals("UFO") && !character.dead) {
        character.jump();
      }
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
