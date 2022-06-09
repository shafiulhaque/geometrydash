static Chars character;
static Levels level1;
static boolean entered;
static boolean autoSpawn;
static boolean won;
static String currentS;
static boolean jump;

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
  background(0);
  won = false;
  if (!entered) {
    if (!character.dead) {
      //delay(100);
      start1();
      int cb = 0;
      //int cy = 0;
      int cf = 0;

      for (int i = 0; i < level1.WIDTH; i++) {
        if (level1.map[0][i].x - character.x <= 30 && level1.map[0][i].x - character.x >= 0) cb = i;
      }
      //for (int i = 0; i < level1.HEIGHT; i++) {
      //  if (level1.map[i][0].y - character.y <= 30 && level1.map[i][0].y - character.y >= 0) cy = i;
      //}
      text(cb, 100, 200);
      //text(cy, 100, 250);

      if (cb <= 0) {
        cf = 0;
      } else {
        cf = cb-1;
      }

      if (jump && (character.y == character.platf || character.y == character.platb) && !character.dead && character.dy == 0.0) character.jump();
      character.move();

      level1.findPlats(character, cb, cf);
      text(character.platf, 100, 60);
      text(character.platb, 100, 80);
      text(character.platform, 100, 100);
      text(character.y, 100, 140);
      text(character.dy, 100, 160);

      level1.display();
      character.display();

      if (level1.map[0][level1.WIDTH - 1].x < 270 && !character.dead) endScreen();

      if (character.change) {
        changeChar();
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


void keyPressed() {
  if (keyCode == 32) {
    jump = true;
    if (!entered) {
      text("JUMP", 100, 100); 
      if (character.y == character.platform && !character.dead && character.dy == 0.0) {
        jump = true;
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
  if (key == 'q') {
    delay(10000);
  }
}

void keyReleased() {
  if (keyCode == 32) {
    jump = false;
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
  background(255);
  noStroke();
  fill(0);
  textAlign(LEFT);
  textSize(20);
  text("AUTORESPAWN: " + autoSpawn + " (PRESS A TO CHANGE)", 20, 20);
  rect(0, height * .75 + 30, width, height * .25);
  rect(0, 0, width, character.top);
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
