static Chars character;
static Portal joe;
static Portal joe2;
static Portal joe3;
static Portal joe4;
static boolean entered;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  joe = new Portal(800, 300, "UFO");
  joe2 = new Portal(1800, 300, "ROCKET");
  joe3 = new Portal(2800, 300, "BLOCK");
  joe4 = new Portal(3800, 300, "SPIKE");
  entered = false;
}

void draw() {
  //delay(20);
  if (!entered) {
    background(255);
    noStroke();
    fill(0);
    rect(0, height * .75, width, height * .25);
    rect(0, 0, width, character.top);
    character.dead(joe);
    character.dead(joe2);
    character.dead(joe3);
    character.dead(joe4);
    joe.place();
    joe2.place();
    joe3.place();
    joe4.place();
    if (character.change) {
      if (character.type.equals("ROCKET")) {
        character = new Rocket(character.x, character.y);
      }
      if (character.type.equals("UFO")) {
        character = new UFO(character.x, character.y);
      }
      if (character.type.equals("BLOCK")) {
        character = new Chars(character.x, character.y);
      }
      if (character.type.equals("SPIKE")) {
        character = new Spike(character.x, character.y);
      }
      character.change = false;
    }
    if (!character.dead) character.display();
    character.move();
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
      } else if (character.type().equals("ROCKET") && !character.dead) {
        character.jump();
      } else if (character.type().equals("UFO") && !character.dead) {
        character.jump();
      } else if (character.type().equals("SPIKE") && !character.dead) {
        character.jump();
      }
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
