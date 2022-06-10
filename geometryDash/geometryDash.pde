static Chars character;
static boolean entered;
static Levels level;
static boolean autoSpawn;
static boolean won;
static String currentS;
static PImage blockIm;
PImage startUp;
PImage startText;
int timer;
ArrayList<levelsMenu> levelList;
infoMenu info = new infoMenu();
levelsMenu level1 = new levelsMenu(color(50, 95, 170), "level1.txt");
levelsMenu level2 = new levelsMenu(color(100, 125, 30), "level2.txt");
levelsMenu level3 = new levelsMenu(color(150, 45, 70), "level3.txt"); 
boolean inMenu;
int currLevel;
PImage skin;

void setup() {
  size(900, 600);
  character = new Chars();
  blockIm = loadImage("geoBlockImg.jpg");
  blockIm.resize(30, 30);
  inMenu = true;
  startUp = loadImage("startUp.jpg");
  startUp.resize(900, 600);
  startText = loadImage("startText.png");
  image(startUp, 0, 0);
  image(startText, 75, 200);
  timer = 120;
  currLevel = 0;
  levelList = new ArrayList<levelsMenu>();
  levelList.add(info);
  levelList.add(level1);
  levelList.add(level2);
  levelList.add(level3);
  entered = false;
  won = false;
  autoSpawn = false;
}

void draw() {
  if (timer != 0) { 
    if(inMenu && timer >= 30){
      noFill();
      stroke(255, 255, 0);
      rect(200, 300, 450, 10);
      fill(0, 255, 0);
      rect(200, 300, 5 * (120 - timer), 10);
    }
    timer--;
  } else {
    currentS = levelList.get(currLevel).levelName;
    if (inMenu) {
      stroke(255);
      background(0);
      fill(0);
      levelList.get(currLevel).display(width - 100, height - 100);
      if (!currentS.equals("tutorial")) text(levelList.get(currLevel).levelName, 450, 200);
    } else {
      if (!entered) {
        if (!character.dead) {
          background(40, 90, 190);
          noStroke();
          fill(0);
          textAlign(LEFT);
          textSize(20);
          if (autoSpawn) text("AUTORESPAWN: ON (PRESS A TO CHANGE)", 20, 20);
          else text("AUTORESPAWN: OFF (PRESS A TO CHANGE)", 20, 20);
          rect(0, height * .75, width, height * .25);
          rect(0, 0, width, character.top);
          level.display(blockIm);
          int c = 0;
          int cSide = 0;
          for (int i = 0; i < level.WIDTH; i++) {
            if (level.map[0][i].x - character.x <= 30 && level.map[0][i].x - character.x >= 0) c = i;
            if (level.map[0][i].x + character.sideL - character.x <= 30 && level.map[0][i].x + character.sideL - character.x >= 0) cSide = i;
          }
          Block highest = level.map[level.HEIGHT - 1][c];
          character.display();
          character.move();
          for (int j = level.HEIGHT- 1; j > 0; j--) {
            Block currB = level.map[j][c];
            Block currBSide = level.map[j][cSide];
            stroke(255, 0, 0);
            fill(255, 0, 0); 
            if (!currB.isEmpty) {
              character.dead(currB);
              if (currB.y < highest.y) highest = currB;
              //character.dead(currB);
              character.dead(highest);
            }
            if (!currBSide.isEmpty) {
              character.dead(currBSide);
            }
          }
          if (level.map[0][level.WIDTH - 1].x < 270 && !character.dead) { 
            textSize(40);
            textAlign(CENTER);
            text("YOU BEAT THE LEVEL! CONGRATS! ", width / 2, height / 3);
            text("PRESS N TO GO BACK TO THE MENU", width / 2, height / 2);
            won = true;
          }
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
            level = new Levels(currentS);
            character = new Chars();
          } else {
            popUp();
          }
        }
      } else {
        popUp();
      }
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
    text("PRESS N TO LEAVE", width * .5, height * .7);
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
  if (!inMenu) {
    if (keyCode == 32 && !character.dead) {
      if (!entered) {
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
    if (key == 'r' && (!autoSpawn && character.dead)) {
      character.dead = false;
      level = new Levels(currentS);
    }
    if (key == 'n' && (won || entered)) {
      entered = false;
      inMenu = true;
    }
  } else {
    if (keyCode == LEFT  && timer == 0) {
      timer = 20;
      currLevel--;
      if (currLevel < 0) currLevel = levelList.size() - 1;
    }
    if (keyCode == RIGHT && timer == 0) {
      timer = 20;
      currLevel++;
      if (currLevel > levelList.size() - 1) currLevel = 0;
    }
  }
}

void mouseClicked() {
  if (inMenu) {
    if (dist(mouseX, mouseY, 450, 300) < 15 && !currentS.equals("tutorial")) { 
      currentS = "level" + currLevel + ".txt";
      inMenu = false;
      level = new Levels(currentS);
    }
  }
}
