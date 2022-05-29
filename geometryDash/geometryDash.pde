static Chars character;
static Levels level1;
static boolean entered;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  level1 = new Levels("level1.txt");
  entered = false;
}

void draw() {
  //delay(20);
  if (!entered){
  background(255);
  noStroke();
  fill(0);
  rect(0, height * .75, width, height * .25);
  character.move();
  for (int i = 0; i < level1.WIDTH; i++) {
      for (int j = 0; j < level1.HEIGHT; j++) {
        if (level1.map[j][i] != null) {
          character.dead(level1.map[j][i]);
          character.dead(level1.map[j][i]);
          level1.map[j][i].place();
        }
      }
    } 
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
    }
  }
  if (keyCode == ENTER) {
    entered = !entered;
  }
}
