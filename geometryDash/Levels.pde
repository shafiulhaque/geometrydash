public class Levels {
  Block[][] map;
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
              map[i][j] = new Block(30 * (j + 1), 30 * (HEIGHT - i));
              break;
            case "t":
              map[i][j] = new Triangle(30 * (j + 1), 30 * (HEIGHT - i));
              break;
            case "n":
              map[i][j] = null;
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

  void display() {
    for (int i = 0; i < HEIGHT; i++) {
      for (int j = 0; j < WIDTH; j++) {
        if (map[i][j] != null) {
          map[i][j].place();
        }
      }
    }
  }
}
