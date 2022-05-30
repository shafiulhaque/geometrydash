static Chars character;
static boolean entered;
static Levels level1;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  level1 = new Levels("level1.txt");
  entered = false;
}

void draw() {
  //delay(30); 
  if (!entered) {
    background(255);
    noStroke();
    fill(0);
    rect(0, height * .75, width, height * .25);
    float sideL = character.sideL;
    int r = 0;
    for (int i = 0; i < level1.WIDTH; i++) {
      if (level1.map[0][i].x - character.x <= 30 && level1.map[0][i].x - character.x > 0) {
        r = i;
        //break;
      }
    }
    Block highest = level1.map[level1.HEIGHT - 1][r];
    for (int j = level1.HEIGHT- 1; j > 0; j--) {
      Block currB = level1.map[j][r];
      stroke(255, 0, 0);
      fill(255, 0, 0);
      line(0, character.platform, character.x, character.platform);
      if (!currB.isEmpty) {
        character.dead(currB);
        if (currB.y < highest.y) highest = currB;
        line(highest.x, 0, highest.x, highest.y);
        character.dead(highest);
        //character.platform = currB.y;
      }
    }
    if (level1.map[0][level1.WIDTH - 1].x < 270 ) character.platform = 420;
    level1.display();
    character.move();
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
