static Chars character;
static Levels level;
static boolean entered;
static boolean autoSpawn;
static boolean won;
static String currentS;
static boolean jump;
static int[] colors;
PImage startUp;
PImage startText;
int timer;
ArrayList<levelsMenu> levelList;
levelsMenu info = new levelsMenu();
levelsMenu level1 = new levelsMenu(950, 50, color(50, 95, 170), "stereo madness");
levelsMenu level2 = new levelsMenu(1850, 50, color(100, 125, 30), "back on track");
levelsMenu level3 = new levelsMenu(2750, 50, color(150, 45, 70), "level3"); 
levelsMenu level4 = new levelsMenu(3650, 50, color(150, 45, 70), "level4"); 
boolean inMenu;
int currLevel;
PImage skin;
int size;
PImage deathScr;
PImage pauseScr;
int opaqCheck;
PFont font;
PImage[] charimg;

void setup() {
  size(900, 600);
  character = new Chars();
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
  levelList.add(level4);
  entered = false;
  won = false;
  autoSpawn = false;
  size = levelList.size();
  deathScr = loadImage("deathScreen.png");
  opaqCheck = 0;
  font = createFont("PUSAB___.otf", 40);
  textFont(font);
  pauseScr = loadImage("pauseScreen.png");
  charimg = new PImage[3];
  charimg[0] = loadImage("Batman.png");
  charimg[0].resize(30, 30);
  charimg[1] = loadImage("Rocket.png");
  charimg[1].resize(40, 30);
}

void draw() {
  if (timer != 0) { 
    if (inMenu && timer > 30) {
      noFill();
      stroke(255, 255, 0);
      rect(200, 300, 450, 10);
      fill(0, 255, 0);
      rect(200, 300, 5 * (120 - timer), 10);
    }
    timer--;
  } else {
    currentS = levelList.get(currLevel).levelName + ".txt";
    if (inMenu) {
      stroke(255);
      background(0);
      fill(0);
      for (int i = 0; i < size; i++) {
        levelList.get(i).move();
        levelList.get(i).display(width - 100, height - 100);
      }
      if (!levelList.get(currLevel).levelName.equals("tutorial")) text(levelList.get(currLevel).levelName, levelList.get(currLevel).x + 400, 200);
    } else {
      if (!entered) {
        if (!character.dead) {
          start1();
          int cb = 0;
          int cf = 0;
          for (int i = 0; i < level.WIDTH; i++) {
            if (level.map[0][i].x - character.x <= 30 && level.map[0][i].x - character.x >= 0) cb = i;
          }
          if (cb <= 0) {
            cf = 0;
          } else {
            cf = cb-1;
          }
          colors = level.colors[level.color1];
          background(colors[1], colors[2], colors[3]);
          character.jump(jump);
          character.move();
          level.findPlats(character, cb, cf);
          level.display();
          character.display(charimg);
          if (level.map[0][level.WIDTH - 1].x < 270 && !character.dead) endScreen();
          if (character.change) changeChar();
        } else {
          if (autoSpawn) {
            level = new Levels(currentS);
            character = new Chars();
            opaqCheck = 0;
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


void keyPressed() {
  if (!inMenu) {
    if (keyCode == 32 && !character.dead) {
      if (!entered) {
        jump = true;
        if (character.y == character.platform) {
          jump = true;
        } else if (character.type().equals("ROCKET")) {
          jump = true;
        } else if (character.type().equals("UFO")) {
          jump = true;
        } else if (character.type().equals("SPIKE")) {
          jump = true;
        }
      }
    }
    if (keyCode == ENTER) if (!character.dead)entered = !entered;
    if (key == 'a') autoSpawn = !autoSpawn;
  } else {
    if (keyCode == LEFT && levelList.get(currLevel).x == 50) {
      for (int i = 0; i < size; i++) levelList.get(i).arrL();
      for (int i = 0; i < size; i++) { 
        if (levelList.get(i).x ==  900 * (size - 1) + 50) {
          levelList.get(i).x = -850;
          break;
        }
      }
      if (currLevel == 0) currLevel = size - 1;
      else currLevel--;
    } else if (keyCode == RIGHT && levelList.get(currLevel).x == 50) {
      for (int i = 0; i < size; i++) levelList.get(i).arrR();
      for (int i = 0; i < size; i++) { 
        if (levelList.get(i).x == -850) {
          levelList.get(i).x = 900 * (size - 1) + 50;
          break;
        }
      }
      if (currLevel == size - 1) currLevel = 0;
      else currLevel++;
    }
  }
}

void keyReleased() {
  if (keyCode == 32) {
    jump = false;
  }
}

void popUp() {
  if (entered && !character.dead) {
    if (opaqCheck == 0) {
      noStroke();
      fill(0, 0, 0, 200);
      rect(25, 25, 850, 550);
      opaqCheck++;
      fill(255);
      textAlign(CENTER);
      text(levelList.get(currLevel).levelName, 420, 100);
    }
    fill(0);
    rect(10, 10, 100, 80);
    fill(255);
    textAlign(LEFT);
    text(mouseX + ", " + mouseY, 20, 30);
    image(pauseScr, 175, 100);
  } else if (!autoSpawn && character.dead) {
    if (opaqCheck == 0) {
      fill(0, 0, 0, 100);
      rect(190, 110, 470, 330);
      opaqCheck++;
      stroke(0);
      fill(255);
      textAlign(CENTER);
      text(levelList.get(currLevel).levelName, 420, 200);
    }
    image(deathScr, 175, 100);
  }
}

void endScreen() {
  textSize(40);
  textAlign(CENTER);
  text("YOU BEAT THE LEVEL! CONGRATS! ", width / 2, height / 3);
  if (!currentS.equals("level2.txt")) text("PRESS N FOR THE NEXT MAP", width / 2, height / 2);
  else text("PRESS N TO RETRY THIS MAP", width / 2, height / 2);
  //currentS = "level2.txt";
  won = true;
}

void start1() {
  background(levelList.get(currLevel).col);
  noStroke();
  fill(0);
  textAlign(LEFT);
  textSize(20);
  if (autoSpawn) text("AUTORESPAWN: ON (PRESS A TO CHANGE)", 20, 20);
  else text("AUTORESPAWN: OFF (PRESS A TO CHANGE)", 20, 20);
  //rect(0, height * .75 + 30, width, height * .25);
  //rect(0, 0, width, character.top);
}

void changeChar() {
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


void mouseClicked() {
  if (inMenu) {
    if (dist(mouseX, mouseY, 450, 300) < 15 && !currentS.equals("tutorial")) { 
      currentS = levelList.get(currLevel).levelName;
      inMenu = false;
      character = new Chars();
      opaqCheck = 0;
      level = new Levels(currentS + ".txt");
    }
  } else {
    if (!autoSpawn && character.dead) {
      if (dist(mouseX, mouseY, 297, 440) < 40) {
        character = new Chars();
        level = new Levels(currentS);
        opaqCheck = 0;
      } else if (dist(mouseX, mouseY, 550, 440) < 40)inMenu = true;
    }
    if (entered && !character.dead) {
      if (dist(mouseX, mouseY, 343, 325) < 87) {
        entered = false;
        opaqCheck = 0;
      } else if (dist(mouseX, mouseY, 579, 325) < 87) {
        entered = false;
        inMenu = true;
      }
    }
  }
}
