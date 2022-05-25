static Chars character;
static Block block;
static Triangle tri;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  block = new Block(575, 450);
  tri = new Triangle(300, 450);
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  rect(0, height * .75, width, height * .25);
  character.move();
  character.display();
  block.place();
  tri.place();
}

void keyPressed() {
  if (keyCode == 32) {
    if (character.y == height * .75 - character.sideL) {
      character.jump();
    }
  }
}
