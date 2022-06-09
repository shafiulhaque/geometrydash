static Chars character;
static boolean entered;
static Levels level;
static boolean autoSpawn;
static boolean won;
static String currentS;
static int levelCurr;
static PImage blockIm;
PImage startUp;
int timer;
ArrayList<levelsMenu> levelList;
levelsMenu level1 = new levelsMenu(color(200, 25, 0));
levelsMenu level2 = new levelsMenu(color(100, 125, 30));
levelsMenu level3 = new levelsMenu(color(150, 45, 70)); 
boolean inMenu;

void setup() {
  size(900, 600);
  //character = new Chars();
  //levelCurr = 1;
  //currentS = "level" + levelCurr + ".txt";
  //level = new Levels(currentS);
  //entered = false;
  //autoSpawn = false;
  //won = false;
  //blockIm = loadImage("geoBlockImg.jpg");
  //blockIm.resize(30, 30);
  inMenu = true;
  startUp = loadImage("startUp.png");
  startUp.resize(900, 600);
  image(startUp, 0, 0);
  timer = 60;
}

void draw() {
  //delay(100);
  if (timer != 0) timer--;
  else {
    won = false;
    if (!entered) {
  //    if (!character.dead) {
  //      background(40, 90, 190);
  //      noStroke();
  //      fill(0);
  //      textAlign(LEFT);
  //      textSize(20);
  //      if (autoSpawn) text("AUTORESPAWN: ON (PRESS A TO CHANGE)", 20, 20);
  //      else text("AUTORESPAWN: OFF (PRESS A TO CHANGE)", 20, 20);
  //      rect(0, height * .75, width, height * .25);
  //      rect(0, 0, width, character.top);
  //      level.display(blockIm);
  //      int c = 0;
  //      int cSide = 0;
  //      for (int i = 0; i < level.WIDTH; i++) {
  //        if (level.map[0][i].x - character.x <= 30 && level.map[0][i].x - character.x >= 0) c = i;
  //        if (level.map[0][i].x + character.sideL - character.x <= 30 && level.map[0][i].x + character.sideL - character.x >= 0) cSide = i;
  //      }
  //      textSize(15);
  //      text("c= " + c, 200, 200);
  //      text("cSide = " + cSide, 200, 230);
  //      Block highest = level.map[level.HEIGHT - 1][c];
  //      character.display();
  //      character.move();
  //      for (int j = level.HEIGHT- 1; j > 0; j--) {
  //        Block currB = level.map[j][c];
  //        Block currBSide = level.map[j][cSide];
  //        stroke(255, 0, 0);
  //        fill(255, 0, 0); 
  //        if (!currB.isEmpty) {
  //          fill(0, 255, 0);
  //          line(currB.x, 0, currB.x, currB.y);
  //          character.dead(currB);
  //          if (currB.y < highest.y) highest = currB;
  //          //character.dead(currB);
  //          character.dead(highest);
  //        }
  //        if (!currBSide.isEmpty) {
  //          fill(255, 0, 0);
  //          line(currBSide.x, 0, currBSide.x, currBSide.y);
  //          character.dead(currBSide);
  //        }
  //      }
  //      if (level.map[0][level.WIDTH - 1].x < 270 && !character.dead) { 
  //        textSize(40);
  //        textAlign(CENTER);
  //        text("YOU BEAT THE LEVEL! CONGRATS! ", width / 2, height / 3);
  //        if (!currentS.equals("level3.txt")) text("PRESS N FOR THE NEXT MAP", width / 2, height / 2);
  //        else text("PRESS N TO RETRY THIS MAP", width / 2, height / 2);
  //        won = true;
  //      }
  //      if (character.change) {
  //        if (character.type.equals("ROCKET")) {
  //          character = new Rocket(character.x, character.y);
  //        }
  //        if (character.type.equals("UFO")) {
  //          character = new UFO(character.x, character.y);
  //        }
  //        if (character.type.equals("BLOCK")) {
  //          character = new Chars(character.x, character.y);
  //        }
  //        if (character.type.equals("SPIKE")) {
  //          character = new Spike(character.x, character.y);
  //        }
  //        character.change = false;
  //      }
  //    } else {
  //      if (autoSpawn) {
  //        level = new Levels(currentS);
  //        character = new Chars();
  //      } else {
  //        popUp();
  //      }
  //    }
  //  } else {
  //    popUp();
    }
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
  if (keyCode == 32 && !inMenu && !character.dead) {
    if (!entered && !character.dead) {
      if (character.y == character.platform) {
        character.jump();
      } else if (character.type().equals("ROCKET")) {
        character.jump();
      } else if (character.type().equals("UFO")) {
        character.jump();
      } else if (character.type().equals("SPIKE")) {
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
    level = new Levels(currentS);
  }
  if (key == 'n' && won) {
    character = new Chars();
    if (levelCurr != 3) levelCurr++;
    currentS = "level" + levelCurr + ".txt";
    level = new Levels(currentS);
  }
}
