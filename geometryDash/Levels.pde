import java.util.*;
import java.io.*;

public class Levels {
  Block[][] map;
  void Levels(File file) throws IOException {
    BufferedReader reader = createReader(file);
    String isGeoFile = reader.readLine();
    if (isGeoFile.equals("GEOFILE")) {
      
    }
  }
}
