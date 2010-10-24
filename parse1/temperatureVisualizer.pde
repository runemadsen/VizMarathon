import toxi.geom.*;
import toxi.math.*;

public class TemperatureVisualizer extends AbstractVisualizer
{
  private HashMap data = new HashMap();
  private int curYear = 2009;
  //  private InterpolateStrategy is=new CircularInterpolation(true);

  public TemperatureVisualizer() {
    parseCsv();
  }

  float ang = 0, target = PI;

  private void parseCsv() {
    String[] lines = loadStrings("temperature.txt");

    for(int i = 1; i < lines.length; i++) {
      String chunks[] = lines[i].split(",");
      int year = Integer.parseInt(chunks[0].trim());
      float[] monthtemps = new float[12];
      for (int m=1; m < (monthtemps.length+1); m++) {
        if (m >= chunks.length)
          monthtemps[m-1] = monthtemps[m-2];
        else
          monthtemps[m-1] = /*57.2+1.8**//* 14.0 +*/80 + Float.parseFloat(chunks[m]) /*/100*/;
      }

      data.put(year, monthtemps);
    }
  }

  public void setYear(int year) {
    curYear = year;
  }

  public void display() {
    smooth();

    ellipseMode(CENTER);
    colorMode(HSB);
    noStroke();
    
    float[] thisYear = (float[])data.get(curYear);
    float d = 170, d2 = 240;

    for(int i = 0; i < 12; i++)
    {
      println(i + ": " + thisYear[i]);
      if (thisYear[i] == 0.0) continue;
      float val = d + thisYear[i];
      fill(20, 255, 255);
      arc(0, 0, d, d, i * 2*PI/12 - PI/2, (i+1) * 2*PI/12 - PI/2);
      fill(255);
      arc(0, 0, d2-val/2, d2-val/2, i * 2*PI/12 - PI/2 - radians(2), (i+1) * 2*PI/12 - PI/2 + radians(2));
    }
    
    fill(255);
    ellipse(0, 0, 5, 5);
  }

  public String getTitle() {
    return "Global Temperature";
  }

  public boolean setCountry(String countryCode) {
    return false;
  }
}

