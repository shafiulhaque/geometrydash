static Chars character;
static Block block;

void setup() {
  size(900, 600);
  background(255);
  character = new Chars();
  block = new Block(width * .75 - 30, height * .75 - 30);
}

void draw() {
  background(255);
  fill(0);
  rect(0, height * .75, width, height * .25);
  character.move();
  character.display();
  block.place();
}

void keyPressed() {
  if (keyCode == 32) {
    if (character.y == height * .75 - character.sideL) {
      character.jump();
    }
  }
}
