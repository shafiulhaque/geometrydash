public class Levels {
  Block[][] map;
  Block current;
  String[][] copy;
  String[] mapSize;
  int WIDTH;
  int HEIGHT;
  int[][] colors;
  int color1;
  PImage[] blockskin;
  int jumps;
  int attempts;

  public Levels(String file) {
    try {
      BufferedReader reader = createReader(file);
      String isGeoFile = reader.readLine();
      if (isGeoFile.equals("GEOFILE")) {
        mapSize = reader.readLine().split(" ");
        HEIGHT = parseInt(mapSize[0]);
        WIDTH = parseInt(mapSize[1]);
        int numcol = parseInt(mapSize[2]);
        map = new Block[HEIGHT][WIDTH];
        copy = new String[HEIGHT][WIDTH];
        colors = new int[numcol][4];
        color1 = 0;
        setColor(reader, numcol);
        setLevel(reader);
        blockskin = new PImage[4];
        blockskin[0] = loadImage("geoBlockImg.jpg");
        blockskin[0].resize(30, 30);
        blockskin[1] = loadImage("NormBlock.png");
        blockskin[1].resize(30, 30);
        blockskin[2] = loadImage("SeeThrough.png");
        blockskin[2].resize(30, 30);
        blockskin[3] = loadImage("Slab.png");
        blockskin[3].resize(30, 10);
        jumps = 0;
        attempts = 1;
      }
    }
    catch(IOException e) {
      System.out.print("FILE NOT FOUND");
    }
  }

  void setColor(BufferedReader reader, int num) throws IOException {
    for (int i = 0; i < num; i++) {
      colors[i] = parseInt(reader.readLine().split(" "));
    }
  }

  void setLevel(BufferedReader reader) throws IOException {
    for (int i = 0; i < HEIGHT; i++) {
      copy[i] = reader.readLine().split(" ");
      for (int j = 0; j < WIDTH; j++) {
        switch(copy[i][j]) {
        case "b": 
          map[i][j] = new Block(30 * j, 30 * i, "block");
          break;
        case "d": 
          map[i][j] = new Block(30 * j, 30 * i, "main block");
          break;
        case "x": 
          map[i][j] = new SlantTriangle(30 * j, 30 * i);
          break;
        case "t":
          map[i][j] = new Triangle(30 * j, 30 * i, "up triangle");
          break;
        case "s":
          map[i][j] = new Slab(30 * j, 30 * i);
          break;
        case "e":
          map[i][j] = new emptyBlock(30 * j, 30 * i, "empty");
          break;
        case "r":
          map[i][j] = new Portal(30 * j, 30 * i, "ROCKET");
          break;
        case "u":
          map[i][j] = new Portal(30 * j, 30 * i, "UFO");
          break;
        case "B":
          map[i][j] = new Portal(30 * j, 30 * i, "BLOCK");
          break;
        case "S":
          map[i][j] = new Portal(30 * j, 30 * i, "SPIKE");
          break;
        case "k":
          map[i][j] = new Transporter(30 * j, 30 * i, "MID");
          break;
        case "q":
          map[i][j] = new Triangle(30 * j, 30 * i, "down triangle");
          break;
        case "l":
          map[i][j] = new Triangle(30 * j, 30 * i, "left triangle");
          break;
        case "n":
          map[i][j] = new emptyBlock(30 * j, 30 * i, "black");
          break;
        }
      }
    }
  }

  void findPlats(Chars character, int cb, int cf) {
    if (cb == colors[color1][0] || cf == colors[color1][0]) color1++;
    float platb = 600, platf = 600, platub = 0, platuf = 0;
    for (int j = level.HEIGHT- 1; j > 0; j--) {
      Block currB = map[j][cb];
      Block currBSide = map[j][cf];
      if (!currBSide.isEmpty) {
        character.dead(currBSide);
        if (character.platInt(currBSide) < platf) platf = character.platInt(currBSide);
        if (character.platIntUp(currBSide) > platuf) platuf = character.platIntUp(currBSide);
      }
      if (!currB.isEmpty) {
        character.dead(currB);
        if (character.platInt(currB) < platb) platb = character.platInt(currB);
        if (character.platIntUp(currB) > platub) platub = character.platIntUp(currB);
      }
    }
    character.platb = platb;
    character.platf = platf;
    character.platuf = platuf;
    character.platub = platub;
    character.platformu = platuf;
    if (character.y > character.platform) character.y = character.platform;
  }

  void testerPrint(String[][] copy) {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        print(copy[i][j] + " ");
      }
      print('\n');
    }
  }

  String[][] getCopy() {
    return copy;
  }

  void display() {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        current = map[i][j];
        if (current != null) {
          current.place(blockskin);
        }
      }
    }
  }
}
