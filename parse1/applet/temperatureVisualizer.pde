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
      for (int m=1; m < monthtemps.length; m++) {
        if (m >= chunks.length)
          monthtemps[m-1] = monthtemps[m-2];
        else
          monthtemps[m-1] = /*57.2+1.8**//* 14.0 +*/30 + Float.parseFloat(chunks[m]) /*/100*/;
      }

      data.put(year, monthtemps);
    }
  }

  public void setYear(int year) {
    curYear = year;
  }

  public void display() {
    smooth();
    noStroke();
    colorMode(HSB);
  
    float[] thisYear = (float[])data.get(curYear);
    
    float avg = 0;
    int n = 0;
    for (float f : thisYear) {
      avg += f;
      if (f != 0) n++;
    }
    avg /= n;
    
//    ang = is.interpolate(ang, target, 0.4);
//    rotateY(ang);
//    if (abs(degrees(ang)%180-180) < 10) target += PI;
 
    Spline2D s = new Spline2D();
    s.add(new Vec2D(avg/2, radians(-26)).toCartesian());
    for (int i = 0; i < n; i++) {
      Vec2D a = new Vec2D(avg/2, i*TWO_PI/n + radians(-5)).toCartesian();
      Vec2D b = new Vec2D(avg/2 + thisYear[i]/2, i*TWO_PI/n).toCartesian();
      Vec2D c = new Vec2D(avg/2, i*TWO_PI/n + radians(5)).toCartesian();
      s.add(a).add(b).add(c);
    }
    
    stroke(30, 190, 250);
    fill(30, 250, 250);
    strokeWeight(2);
    beginShape();
    for (Vec2D v : s.computeVertices(20)) {
      vertex(v.x, v.y);
    //ellipse(v.x, v.y,1,1);
    }
    
    endShape();
  }

  public String getTitle() {
    return "Global Temperature";
  }

  public boolean setCountry(String countryCode) {
    return false;
  }
}

