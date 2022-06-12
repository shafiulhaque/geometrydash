PImage startUp;
int timer;
ArrayList<levelScreen> levelList;
int currLevel;
levelScreen level1 = new levelScreen(color(200, 25, 0));
levelScreen level2 = new levelScreen(color(100, 125, 30));
levelScreen level3 = new levelScreen(color(150, 45, 70)); 

void setup() {
  size(900, 600);
  startUp = loadImage("startUp.png");
  startUp.resize(900, 600);
  image(startUp, 0, 0);
  timer = 60;
  currLevel = 0;
  levelList = new ArrayList<levelScreen>();
  levelList.add(level1);
  levelList.add(level2);
  levelList.add(level3);
  
}

void draw() {
  if (timer != 0) timer--;
  else {
    background(0);
    levelList.get(currLevel).display(width - 100, height - 100);
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    currLevel--;
    if(currLevel < 0) currLevel = levelList.size() - 1;
  }
  if (keyCode == RIGHT) {
    currLevel++;
    if(currLevel > levelList.size() - 1) currLevel = 0;
  }
}

void mouseClicked(){

}
