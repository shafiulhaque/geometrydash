static Chars character;
static boolean entered;
static Levels level1;
static boolean autoSpawn;
static boolean won;
static String currentS;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  currentS = "level1.txt";
  level1 = new Levels(currentS);
  entered = false;
  autoSpawn = false;
  won = false;
}

void draw() {
  delay(20);
  won = false;
  if (!entered) {
    if (!character.dead) {
      background(255);
      noStroke();
      fill(0);
      textAlign(LEFT);
      textSize(20);
      text("AUTORESPAWN: " + autoSpawn + " (PRESS A TO CHANGE)", 20, 20);
      rect(0, height * .75, width, height * .25);
      rect(0, 0, width, character.top);
      //float blockC = 0;
      int c = 0;
      int cSide = 0;
      for (int i = 0; i < level1.WIDTH; i++) {
        if (level1.map[0][i].x - character.x <= 30 && level1.map[0][i].x - character.x >= 0) c = i;
      }
      for (int i = 0; i < level1.WIDTH; i++) {
        if (level1.map[0][i].x - (character.x + character.sideL ) <= 30 && level1.map[0][i].x - (character.x + character.sideL) >= 0) cSide = i;
      }
      Block highest = level1.map[level1.HEIGHT - 1][c];
      //Block highestXSideL = level1 .map[level1.HEIGHT - 1][cSide]; 
      character.display();
      character.move();
      for (int j = level1.HEIGHT- 1; j > 0; j--) {
        Block currB = level1.map[j][c];
        Block currBSide = level1.map[j][cSide];
        stroke(255, 0, 0);
        fill(255, 0, 0); 
        if (!currB.isEmpty) {
          //blockC++;
          //character.dead(currB);
          if (currB.y < highest.y) highest = currB;
          character.dead(currB);
          character.dead(highest);
        }
        if (!currBSide.isEmpty) {
          //blockC++;
          //if (currBSide.y < highestXSideL.y) highestXSideL = currBSide;
          character.dead(currBSide);
          //character.dead(highestXSideL);
        }
      }
      //if (blockC == 0) character.platform = 420;
      if (level1.map[0][level1.WIDTH - 1].x < 270 && !character.dead) { 
        textSize(40);
        textAlign(CENTER);
        text("YOU BEAT THE LEVEL! CONGRATS! ", width / 2, height / 3);
        if (!currentS.equals("level2.txt")) text("PRESS N FOR THE NEXT MAP", width / 2, height / 2);
        else text("PRESS N TO RETRY THIS MAP", width / 2, height / 2);
        won = true;
      }
      level1.display();
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
    } else {
      if (autoSpawn) {
        level1 = new Levels(currentS);
        character.dead = false;
      } else {
        popUp();
      }
    }
  } else {
    popUp();
  }
}

void popUp() {
  if (entered && !character.dead) {
    stroke(220);
    fill(130);
    rect(width * .15, height * .15, width * .7, height * .7);
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("GAME IS PAUSED", width * .5, height * .3);
    textSize(20);
    text("PRESS ENTER TO RESUME", width * .5, height * .5);
  } else if (!autoSpawn && character.dead) {
    stroke(220);
    fill(130);
    rect(width * .15, height * .15, width * .7, height * .7);
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("YOU ARE DEAD", width * .5, height * .3);
    textSize(20);
    text("PRESS R TO RESPAWN", width * .5, height * .5);
    text("PRESS A TO TOGGLE AUTO RESPAWN", width * .5, height * .7);
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
    if (!character.dead)entered = !entered;
  }
  if (key == 'a') autoSpawn = !autoSpawn;
  if (key == 'r' && !autoSpawn) {
    character.dead = false;
    level1 = new Levels(currentS);
  }
  if (key == 'n' && won) {
    character = new Chars();
    currentS = "level2.txt";
    level1 = new Levels(currentS);
  }
}
