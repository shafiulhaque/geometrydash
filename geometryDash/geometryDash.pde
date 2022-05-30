static Chars character;
static boolean entered;
static Levels level1;
static int countdown;
static boolean autoSpawn;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  level1 = new Levels("level1.txt");
  entered = false;
  countdown = 0;
  autoSpawn = false;
}

void draw() {
  if (countdown > 0) countdown--;
  if (!entered) {
    background(255);
    noStroke();
    fill(0);
    textSize(10);
    text("AUTORESPAWN: " + autoSpawn + " (PRESS A TO CHANGE)", 20, 20);
    rect(0, height * .75, width, height * .25);
    float blockC = 0;
    int c = 0;
    int cSide = 0;
    for (int i = 0; i < level1.WIDTH; i++) {
      if (level1.map[0][i].x - character.x < 30 && level1.map[0][i].x - character.x > 0) c = i;
    }
    for (int i = 0; i < level1.WIDTH; i++) {
      if (level1.map[0][i].x + character.sideL - character.x < 30 && level1.map[0][i].x + character.sideL - character.x > 0) cSide = i;
    }
    Block highest = level1.map[level1.HEIGHT - 1][c];
    Block highestXSideL = level1.map[level1.HEIGHT - 1][cSide]; 
    for (int j = level1.HEIGHT- 1; j > 0; j--) {
      Block currB = level1.map[j][c];
      Block currBSide = level1.map[j][cSide];
      stroke(255, 0, 0);
      fill(255, 0, 0); 
      if (!currB.isEmpty) {
        blockC++;
        character.dead(currB);
        if (currB.y < highest.y) highest = currB;
        character.dead(highest);
      }
      if (!currBSide.isEmpty) {
        blockC++;
        if (currBSide.y < highestXSideL.y) highestXSideL = currBSide;
        character.dead(currBSide);
      }
    }
    if (blockC == 0) character.platform = 420;
    if (level1.map[0][level1.WIDTH - 1].x < 270 && !character.dead) character.platform = 420;
    if (!character.dead) {
      level1.display();
      character.move();
      character.display();
    } else {
      if (autoSpawn) {
        level1 = new Levels("level1.txt");
        character.dead = false;
      } else {
        background(255);
        popUp();
      }
    }
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
  if (!autoSpawn) {
    stroke(220);
    fill(130);
    rect(width * .15, height * .15, width * .7, height * .7);
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("YOU ARE DEAD", width * .5, height * .3);
    textSize(20);
    text("PRESS R TO RESPAWN", width * .5, height * .5);
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
    if (entered == true) delay(100);
    entered = !entered;
  }
  if (key == 'a') autoSpawn = !autoSpawn;
  if (key == 'r') character.dead = !character.dead;
}
