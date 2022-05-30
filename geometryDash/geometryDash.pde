static Chars character;
static boolean entered;
static Levels level1;
static float xC;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  level1 = new Levels("level1.txt");
  entered = false;
  xC = 0;
}

void draw() {
  //delay(20);
  if (!entered) {
    background(255);
    noStroke();
    fill(0);
    rect(0, height * .75, width, height * .25);
    level1.display();
    character.move();
    for (int i = 0; i < level1.WIDTH; i++) {
      for (int j = 0; j < level1.HEIGHT; j++) {
        if (level1.map[j][i] != null && dist(character.x, character.y, level1.map[j][i].x, level1.map[j][i].y) < 50){
          character.dead(level1.map[j][i]);
          stroke(255, 0, 0);
          line(0, character.platform, 100, character.platform);
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
