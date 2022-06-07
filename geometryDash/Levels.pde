public class Levels {
  Block[][] map;
  Block current;
  String[][] copy;
  String[] mapSize;
  int WIDTH;
  int HEIGHT;

  public Levels(String file) {
    try {
      BufferedReader reader = createReader(file);
      String isGeoFile = reader.readLine();
      if (isGeoFile.equals("GEOFILE")) {
        mapSize = reader.readLine().split(" ");
        HEIGHT = parseInt(mapSize[0]);
        WIDTH = parseInt(mapSize[1]);
        map = new Block[HEIGHT][WIDTH];
        copy = new String[HEIGHT][WIDTH];
        for (int i = 0; i < HEIGHT; i++) {
          copy[i] = reader.readLine().split(" ");
          for (int j = 0; j < WIDTH; j++) {
            switch(copy[i][j]) {
            case "b": 
              map[i][j] = new Block(30 * j, 30 * i);
              break;
            case "t":
              map[i][j] = new Triangle(30 * j, 30 * i);
              break;
            case "s":
              map[i][j] = new Slab(30 * j, 30 * i);
              break;
            case "e":
              map[i][j] = new emptyBlock(30 * j, 30 * i);
              break;
            case "pR":
              map[i][j] = new Portal(30 * j, 30 * i, "ROCKET");
              break;
            case "pU":
              map[i][j] = new Portal(30 * j, 30 * i, "UFO");
              break;
            case "pB":
              map[i][j] = new Portal(30 * j, 30 * i, "BLOCK");
              break;
            case "pS":
              map[i][j] = new Portal(30 * j, 30 * i, "SPIKE");
              break;
            }
          }
        }
      }
    }
    catch(IOException e) {
      System.out.print("FILE NOT FOUND");
    }
  }

  void findPlats(Chars character, int cb, int cf) {
    for (int j = level1.HEIGHT- 1; j > 0; j--) {
      Block currB = map[j][cb];
      Block currBSide = map[j][cf];
      stroke(255, 0, 0);
      fill(255, 0, 0); 
      if (!currB.isEmpty) {
        character.dead(currB);
      }
      if (!currBSide.isEmpty) {
        character.dead(currBSide);
      }
    }
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
        if (map[i][j] != null) {
          current = map[i][j];
          current.place();
        }
      }
    }
  }
}
