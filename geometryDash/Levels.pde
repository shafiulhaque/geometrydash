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
            }
          }
        }
      }
    }
    catch(IOException e) {
      System.out.print("FILE NOT FOUND");
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

  void display(PImage img) {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        current = map[i][j];
        if (current != null) {
          current.place(img);
        }
      }
    }
  }
}
