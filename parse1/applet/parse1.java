import processing.core.*; 
import processing.xml.*; 

import controlP5.*; 
import toxi.geom.*; 
import toxi.math.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class parse1 extends PApplet {



ControlP5 controlP5;
Slider s;

String lines[];
int yr[];
float total[], plus[];
float rate[];

int sliderVal = 1950;

int curYearIndex = 0;

boolean foo = false;

gmslModule gm;
co2RegModule co2;
ppmModule ppm;

TemperatureVisualizer tempViz;

// in sqkm
final float EARTH_SUR = 148940000.0f;

PFont silk8;

ArrayList circles;
long iterationCounter = 0;

class Circle {
  public float x, y, radius;
  public int myColor;
  
  public Circle(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    myColor = color(64,64,64,64);
  }
  
  public void draw() {
    fill(myColor);
    stroke(myColor);
    strokeWeight(3);
    ellipse((int)x, (int)y, (int)radius*2, (int)radius*2);
  }
 
 public boolean contains(float x, float y) {
   float dx = this.x - x;
   float dy = this.y - y;
   return sqrt(dx*dx + dy*dy) <= radius;
 }
  
  public float distanceToCenter() {
    float dx = x - WIDTH/2;
    float dy = y - HEIGHT/2;
    return (sqrt(dx*dx + dy*dy));
  } 
  
  public boolean intersects(Circle c) {
    float dx = c.x - x;
    float dy = c.y - y;
    float d = sqrt(dx*dx + dy*dy);
    return d < radius || d < c.radius;
  }
}


class ppmModule
{
  public float data[];
  
  public ppmModule()
  {
     String lines[] =  loadStrings("ppm1980.txt");
     
     data = new float[lines.length];
     
     for(int i = 0; i < lines.length; i++)
     {
         data[i] = PApplet.parseFloat(lines[i]);
     }
  }
}

// ct 37
class co2RegModule
{
  
  public String regions[] = {"OECD North America",
"OECD Pacific",
"OECD Europe",
"Africa",
"Middle East",
"Non-OECD Europe",
"Former Soviet Union",
"Latin America",
"Asia without China",
"China"};
  public String lines[];
  public float data[][];
  
  public co2RegModule()
  {
    
    data = new float[10][38];
  
    lines = loadStrings("co2region.txt");
  
    for(int i = 0; i < lines.length; i++)
    {
       String spl[] = lines[i].split("\t");
       for(int j = 0; j < spl.length; j++)
       {
          data[i][j] = PApplet.parseFloat(spl[j]); 
          print(data[i][j] + " _ ");
       }
       println();
    }
  
  }
}

class gmslModule
{
  String lines[];
  int yr_raw[], yr[];
  public float gmsl_raw[], gmsl[];
  
  public gmslModule()
  {
    lines = loadStrings("gmsl.txt");
    
    yr_raw = new int[lines.length];
    gmsl_raw = new float[lines.length];
    yr = new int[lines.length/12];
    gmsl = new float[lines.length/12];
    
    for(int i = 0; i < lines.length; i++)
    {
      String spl[] = lines[i].split("\t");
    
      yr_raw[i] = PApplet.parseInt(spl[0].substring(4));
      gmsl_raw[i] = PApplet.parseFloat(spl[1]);
    //  println(i + " " + yr_raw[i] + "/" + gmsl_raw[i]);
    }
    
    
    for(int i = 0; i < lines.length/12; i++)
    {
       float sum = .0f;
       for(int j = i*12; j<i*12+12; j++)
       {
         sum += gmsl_raw[j];
       }
       
       float avg = sum/12.0f;
       gmsl[i] = avg;
      // println(avg);
    }
  } 
}

public void setup()
{
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(1024, 768);
  background(255);
  smooth();
  
  silk8 = loadFont("Silkscreen-8.vlw"); 
  textFont(silk8);
  
  gm = new gmslModule();
  co2 = new co2RegModule();
  ppm = new ppmModule();
  tempViz = new TemperatureVisualizer();
  
  controlP5 = new ControlP5(this);
  s = controlP5.addSlider("sliderVal",1950,2049,100,height-100,width-200,10);
  s.setId(1);
  s.setArrayValue(new float[] {0, 100});  

  lines = loadStrings("worldpopulation.csv");

  yr = new int[lines.length];
  total = new float[lines.length];
  plus = new float[lines.length];

  rate = new float[lines.length];

  for(int i = 0; i < lines.length; i++)
  {
    String spl[] = lines[i].split(";");


    yr[i] = PApplet.parseInt(spl[0]);
    total[i] = PApplet.parseFloat(spl[1]);
    plus[i] = PApplet.parseFloat(spl[3]);
    rate[i] = PApplet.parseFloat(spl[2]);

  //  println(plus[i]);

    /*
     noStroke();
     fill(color(50));
     rect(i * 10, height-total[i]/20000000.0f, 3, total[i]/20000000.0f);
     fill(color(100));
     rect(i * 10 + 3, height-plus[i]/2000000.0f, 3, plus[i]/2000000.0f);
     fill(color(10));
     
     if(i%10==7)
     ellipse(i * 10, 100, total[i]/200000000.0f, total[i]/200000000.0f);
     */
  }
  
 circles = createPackC(); 
}

public void update()
{
 // println(sliderVal);
  
  
  curYearIndex = sliderVal - 1950;
  
}

public ArrayList createPackC()
{
  ArrayList circles = new ArrayList();
  //colorMode(HSB, 255);
  
    for(int i = 0; i < co2.data.length; i++)
  {
    int ind = 0;
    if(sliderVal >= 1971)
      ind = sliderVal - 1971;
     
     float rc = sqrt(co2.data[i][min(ind, 37)]/PI);
     
     Circle c = new Circle(width/2+100 * cos(i * 2*PI/co2.data.length), height/2-100*sin(i * 2*PI/co2.data.length),  rc);
     c.myColor = color(200, 200, 100);
     circles.add(c);
    
    /*
    pushMatrix();
    translate(width/2 + r * cos(i * 2*PI/co2.data.length), height/2-r*sin(i * 2*PI/co2.data.length));
    fill(color(200, 200, 50));
    ellipse(0, 0, 1 * rc * 2,  1 * rc * 2);
    fill(color(30));
    text(co2.regions[i], 0, 0); 
    popMatrix();
    */
  }
  
  //colorMode(RGB,255);
  return circles;
 
}

public void draw()
{
  update();
  
  background(255);
  
 // noStroke();
  
  
  float space_sqm = 1000000 * EARTH_SUR / total[curYearIndex];
  
  float r = sqrt(space_sqm/PI);
 // println(r);
  
  // GMSL
  noStroke();
  
  fill(color(180, 180, 220));
  float d = 2*r + 2*gm.gmsl[min(curYearIndex, 50)]/4;
 // ellipse(width/2, height/2, d, d);
  for(int i = 0; i < 12; i++)
  {
     float val = 2*r + 2*gm.gmsl_raw[min(curYearIndex, 50)*12+i]/4;
     //fill(color(180, 180, i*10+50));
     arc(width/2, height/2, val, val, i * 2*PI/12 - PI/2, (i+1) * 2*PI/12 - PI/2);
  }
  

  // PLANET
  strokeWeight(2);
  stroke(color(40));
  fill(color(240));
  ellipse(width/2, height/2, 2*r, 2*r);
  
  // ATMOSPHERE PPM
  
  noFill();
  
  strokeWeight(2);
  stroke(color(200, 200, 50));
  int ppmind = 0;
  if(sliderVal >= 1980)
      ppmind = sliderVal - 1980;
      
  ellipse(width/2, height/2, 2*r + ppm.data[min(ppmind, 29)]/2.0f, 2*r + ppm.data[min(ppmind, 29)]/2.0f);
  line(width/2 + cos(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), height/2 - sin(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), width/2 + cos(PI/3) * 1.3f *(r + ppm.data[min(ppmind, 29)]/4.0f), height/2 - sin(PI/3) * 1.3f * (r + ppm.data[min(ppmind, 29)]/4.0f));
  fill(color(40));
  noStroke();
  
  text(ppm.data[min(ppmind, 29)] + " parts per million CO2 concentration", width/2 + cos(PI/3) * 1.3f *(r + ppm.data[min(ppmind, 29)]/4.0f), height/2 - sin(PI/3) * 1.3f * (r + ppm.data[min(ppmind, 29)]/4.0f));
  
  noFill();
  stroke(color(255, 20, 20));
  ellipse(width/2, height/2, 2*r + 350.0f/2.0f, 2*r + 350.0f/2.0f);
  line(width/2 + cos(PI/3.5f) * (r + 350.0f/4.0f), height/2 - sin(PI/3.5f) * (r + 350.0f/4.0f), width/2 + cos(PI/3.5f) * 1.3f *(r + 350.0f/4.0f), height/2 - sin(PI/3.5f) * 1.3f * (r + 350.0f/4.0f));
  fill(color(40));
  noStroke();
  
  text(350.0f + " boundary CO2 parts per million.", width/2 + cos(PI/3.5f) * 1.3f *(r + 350.0f/4.0f), height/2 - sin(PI/3.5f) * 1.3f * (r + 350.0f/4.0f));
  
  

  
 
  
  float co2sum = .0f;
  
  for(int i = 0; i < co2.data.length; i++)
  {
    int ind = 0;
    if(sliderVal >= 1971)
      ind = sliderVal - 1971;
      
     co2sum += co2.data[i][min(ind, 37)];
     
     float rc = sqrt(co2.data[i][min(ind, 37)]/PI);
    
    /*
    pushMatrix();
    translate(width/2 + r * cos(i * 2*PI/co2.data.length), height/2-r*sin(i * 2*PI/co2.data.length));
    fill(color(200, 200, 50));
    ellipse(0, 0, 1 * rc * 2,  1 * rc * 2);
    fill(color(30));
    text(co2.regions[i], 0, 0); 
    popMatrix();
    */
  }
  
  
  
  pushMatrix();
  translate(0, 0);
  for (int i=0; i<circles.size(); i++) {
    ((Circle)circles.get(i)).draw();
    fill(color(30));
    text(co2.regions[i], ((Circle)circles.get(i)).x, ((Circle)circles.get(i)).y); 
  } 
  for (int i=1; i<50; i++) {
    iterateLayout(i);
  }
  popMatrix();
  
  co2sum /= total[curYearIndex];
  co2sum *= 10000000; // in million tons, so scale by 1 million ---> 10 million to get better visual scale
  pushMatrix();
  translate(width/2, 100);
  fill(color(200, 200, 50));
  rect(0, 0-co2sum/2.0f, 20, co2sum);
  
  fill(color(40));
  noStroke();
  text(("" + co2sum/10.0f + " tons personal co2 emission "), 30, -co2sum);
  popMatrix();
  
  tempViz.setYear(sliderVal);
  pushMatrix();
  translate(width/2, height/2);
  popMatrix();
  tempViz.display();
 
  
}

public void mouseReleased()
{
   // circles = createPackC(); 
}

Comparator comp = new Comparator() {
    public int compare(Object p1, Object p2) {
      Circle a = (Circle)p1;
      Circle b = (Circle)p2;
      if (a.distanceToCenter() < b.distanceToCenter()) 
        return 1;
      else if (a.distanceToCenter() > b.distanceToCenter())
        return -1;
      else
        return 0;
    }
};

public void iterateLayout(int iterationCounter) {

  Object circs[] = circles.toArray();
  Arrays.sort(circs, comp);

  //fix overlaps
  Circle ci, cj;
  PVector v = new PVector();

  for (int i=0; i<circs.length; i++) {
    ci = (Circle)circs[i];
    for (int j=i+1; j<circs.length; j++) {
      if (i != j) {
        cj = (Circle)circs[j];
        float dx = cj.x - ci.x;
        float dy = cj.y - ci.y;
        float r = ci.radius + cj.radius;
        float d = (dx*dx) + (dy*dy);
        if (d < (r * r) - 0.01f ) {

          v.x = dx;
          v.y = dy;

          v.normalize();
          v.mult((r-sqrt(d))*0.5f);

            cj.x += v.x;
            cj.y += v.y;
   
            ci.x -= v.x;
            ci.y -= v.y;       
        }
      }
    }
  }

  //Contract
  float damping = 0.1f/(float)(iterationCounter);
  for (int i=0; i<circs.length; i++) {
    Circle c = (Circle)circs[i];
      v.x = c.x-width/2;
      v.y = c.y-height/2;
      v.mult(damping);
      c.x -= v.x;
      c.y -= v.y;
  }
}

public ArrayList createRandomCircles(int n) {
  ArrayList circles = new ArrayList();
  colorMode(HSB, 255);
  while (n-- > 0) {
    Circle c = new Circle(random(width), random(height), random(n)+10);
    c.myColor = color(random(255), 128, 200, 128);
    circles.add(c);
  }
  colorMode(RGB,255);
  return circles;
}

public void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {
    case(1):
     circles = createPackC(); 
    break;
  }
}

public abstract class AbstractVisualizer
{
   public abstract void setYear(int year);
   public abstract void display();
   public abstract String getTitle();
   public abstract boolean setCountry(String countryCode);
}



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

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "parse1" });
  }
}
