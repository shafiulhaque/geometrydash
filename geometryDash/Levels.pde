import java.util.*;
import java.io.*;

public class Levels {
  Block[][] map;
  int WIDTH;
  int HEIGHT;
  
  void Levels(File file) throws IOException {
    String[][] tempCopy;
    BufferedReader reader = createReader(file);
    String isGeoFile = reader.readLine();
    if (isGeoFile.equals("GEOFILE")) {
      String[] mapSize = reader.readLine().split(" ");
      HEIGHT = parseInt(mapSize[0]);
      WIDTH = parseInt(mapSize[1]);
      map = new Block[HEIGHT][WIDTH];
      tempCopy = new String[HEIGHT][WIDTH];
      for(int i = 0; i < HEIGHT; i++){
        tempCopy[i] = reader.readLine().split(" ");
      }
    }
  }
  
  void testerPrint(String[][] copy){
    for(int i = 0; i < copy.length; i++){
      for(int j = 0; j < copy[0].length; j++){
        System.out.println(copy[i][j]);
      }
    }
  }
  
  
}
