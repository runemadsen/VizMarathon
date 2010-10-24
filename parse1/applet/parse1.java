import processing.core.*; 
import processing.xml.*; 

import controlP5.*; 
import toxi.geom.*; 
import toxi.math.*; 
import toxi.geom.*; 
import toxi.math.*; 

import toxi.util.datatypes.*; 
import toxi.math.noise.*; 
import controlP5.*; 
import toxi.math.waves.*; 
import toxi.geom.*; 
import toxi.math.*; 
import toxi.geom.mesh.*; 
import toxi.math.conversion.*; 

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
Habitat h;

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
FuelConsumptionVisualizer fuelViz;

// in sqkm
final float EARTH_SUR = 148940000.0f;

PFont silk8;

ArrayList circles;
long iterationCounter = 0;


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
  public String lines[], linesoil[];
  public float data[][], dataoil[][];
  
  public co2RegModule()
  {
    
    data = new float[10][38];
    dataoil = new float[10][38];
  
    lines = loadStrings("co2region.txt");
    linesoil = loadStrings("co2oil.txt");
  
    for(int i = 0; i < lines.length; i++)
    {
       String spl[] = lines[i].split("\t");
       String sploil[] = linesoil[i].split("\t");
       for(int j = 0; j < spl.length; j++)
       {
          data[i][j] = PApplet.parseFloat(spl[j]); 
          dataoil[i][j] = PApplet.parseFloat(sploil[j]);
         // print(data[i][j] + " _ ");
       }
       //println();
    }
  
  }
}

public void displayAtmos(float r)
{
   noFill();
  
  strokeWeight(2);
  stroke(color(200, 200, 50));
  int ppmind = 0;
  if(sliderVal >= 1980)
      ppmind = sliderVal - 1980;
      
  ellipse(0, 0, 2*r + ppm.data[min(ppmind, 29)]/2.0f, 2*r + ppm.data[min(ppmind, 29)]/2.0f);
  line(cos(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), - sin(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), cos(PI/3) * 1.3f *(r + ppm.data[min(ppmind, 29)]/4.0f), - sin(PI/3) * 1.3f * (r + ppm.data[min(ppmind, 29)]/4.0f));
  fill(color(40));
  noStroke();
  
  text(ppm.data[min(ppmind, 29)] + " parts per million CO2 concentration", cos(PI/3) * 1.3f *(r + ppm.data[min(ppmind, 29)]/4.0f), - sin(PI/3) * 1.3f * (r + ppm.data[min(ppmind, 29)]/4.0f));
  
  noFill();
  stroke(color(255, 20, 20));
  ellipse(0, 0, 2*r + 350.0f/2.0f, 2*r + 350.0f/2.0f);
  line(cos(PI/3.5f) * (r + 350.0f/4.0f),  - sin(PI/3.5f) * (r + 350.0f/4.0f), cos(PI/3.5f) * 1.3f *(r + 350.0f/4.0f), - sin(PI/3.5f) * 1.3f * (r + 350.0f/4.0f));
  fill(color(40));
  noStroke();
  
  text(350.0f + " boundary CO2 parts per million.", cos(PI/3.5f) * 1.3f *(r + 350.0f/4.0f), - sin(PI/3.5f) * 1.3f * (r + 350.0f/4.0f));
  
  
}

class gmslModule
{
  String lines[];
  int yr_raw[], yr[];
  public float gmsl_raw[], gmsl[];
  int yer = 1950;
  
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
 
 public void setYear(int y)
 {
   yer = y;
 } 
 
 public void display(float r)
 {
   // GMSL
  stroke(color(255));
  strokeWeight(2);
  
  fill(color(180, 180, 220));
  float d = 2*r + 2*gmsl[min(curYearIndex, 50)]/4;
 // ellipse(width/2, height/2, d, d);
  for(int i = 0; i < 12; i++)
  {
     float val = 2*r + 2*gmsl_raw[min(curYearIndex, 50)*12+i]/4;
     //fill(color(180, 180, i*10+50));
     arc(0, 0, val * 2 - 200, val * 2 - 200, i * 2*PI/12 - PI/2 + .01f, (i+1) * 2*PI/12 - PI/2 - .01f);
  }
  
    fill(color(40));
    noStroke();
    text(gmsl[min(curYearIndex, 50)] + " mm global annual average sea level", r+50, 20);
 }
}

public void setup()
{
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(1440, 900);
  background(255);
  smooth();
  
  silk8 = loadFont("Silkscreen-8.vlw"); 
  textFont(silk8);
  
  h = new Habitat();
  
  gm = new gmslModule();
  co2 = new co2RegModule();
  ppm = new ppmModule();
  tempViz = new TemperatureVisualizer();
  fuelViz = new FuelConsumptionVisualizer();
  
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
     
     Circle c = new Circle(width/2+100 * cos(i * 2*PI/co2.data.length), height/2-100*sin(i * 2*PI/co2.data.length),  rc, sqrt(co2.dataoil[i][min(ind, 37)]/PI));
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
  
  h.setYear(sliderVal);
  h.display();
  
 // noStroke();
  
  float space_sqm = 1000000 * EARTH_SUR / total[curYearIndex];
  
  float r = sqrt(space_sqm/PI);
 // println(r);
  
  pushMatrix();
  scale(1.5f);
  
  // GMSL  
  pushMatrix();
  translate(width/4, height/4);
  gm.display(100);
  fill(color(255));
  ellipse(0, 0, 200, 200);
  popMatrix();
  

  // PLANET
  pushMatrix();
  translate(2*width/4, 2*height/4);
  strokeWeight(2);
  stroke(color(40));
  fill(color(240));
  ellipse(0, 0, 2*r, 2*r);
  noStroke();
  fill(40);
  text(space_sqm + " square meters of land mass per person (1 pixel = 1 square meter)", r+50, 0);
  popMatrix();
  
  
  pushMatrix();
  translate(width/4, height/4);
  
  fill(color(10));
  ellipse(0, 0, 200, 200);
  

  
  popMatrix();
  
  // TEMP
  tempViz.setYear(min(sliderVal, 2010));
  pushMatrix();
  translate(width/4, height/4);

  tempViz.display();
  popMatrix();
  
  
  noStroke();
  noFill();
 
  
  colorMode(RGB, 255);
  
  pushMatrix();
  
  translate(width/4, height/4);
  pushMatrix();
  scale(.95f);
  String mon[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
  for(int i = 0; i < 12; i++)
  {
     pushMatrix();
     scale(.95f);
     rotate((i-2) * PI/6.0f - PI/12.0f);
     translate(100, 0);
     rotate(PI/2);
     translate(-10,0);
     
   //  translate(50, 0);
     
     fill(color(255));
     text(mon[i], 0, 0);
     popMatrix();
  }
  popMatrix();
  popMatrix();
  
  
    // ATMOSPHERE PPM
  
  pushMatrix();
  translate(width/4, height/4);
  displayAtmos(100);
  popMatrix();
 
  popMatrix();
  
  
  // FUEL
  fuelViz.setYear(sliderVal);
  pushMatrix();
  translate(width/2 + 50, 100);
  fuelViz.display(total[curYearIndex]);
  popMatrix();
  
  

 
  
  float co2sum = .0f;
  
  for(int i = 0; i < co2.data.length; i++)
  {
    int ind = 0;
    if(sliderVal >= 1971)
      ind = sliderVal - 1971;
      
     co2sum += co2.data[i][min(ind, 37)];
     
     float rc = sqrt(co2.data[i][min(ind, 37)]/PI);
  }

  
  
  
  // CIRCLE PACKING
  pushMatrix();
  translate(width/4, height/4);
  for (int i=0; i<circles.size(); i++) {
    ((Circle)circles.get(i)).draw();
    fill(color(30));
    text(co2.regions[i], ((Circle)circles.get(i)).x, ((Circle)circles.get(i)).y); 
  } 
  for (int i=1; i<50; i++) {
    iterateLayout(i);
  }
  popMatrix();
  
  
  // PERSONAL PPM
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
class Habitat extends AbstractVisualizer
{
  String rows[];
  String[] countries;
  int years[];
  float data[][];
  int curYear = 1970;
  float diameter = 8; // size of 1 m2
  int gridWidth = 350;
  
  /*  Setup
  ___________________________________________________________ */
  
  public Habitat()
  {

    background(0);
    smooth();
    
    rows = loadStrings("oecd-forest-percent.csv");
  
    //yr = new int[lines.length];
    String tempyears[] = rows[0].split(",");
    years = new int[tempyears.length - 1];
  
    // remove first row
    for(int i = 1; i < tempyears.length; i++)
    {
        years[i - 1] = PApplet.parseInt(tempyears[i]);
    }
   
    countries = new String[rows.length - 1];
    data = new float[rows.length - 1][5];
  
    for(int i = 1; i < rows.length; i++)
    {
      String columns[] = rows[i].split(",");
      
      countries[i - 1] = columns[0]; 
      data[i - 1][0] = PApplet.parseFloat(columns[1]) / 1000;
      data[i - 1][1] = PApplet.parseFloat(columns[2]) / 1000;
      data[i - 1][2] = PApplet.parseFloat(columns[3]) / 1000;
      data[i - 1][3] = PApplet.parseFloat(columns[4]) / 1000;
      data[i - 1][4] = PApplet.parseFloat(columns[5]) / 1000; 
    }
  }
  
  /*  Draw
  ___________________________________________________________ */
  
  public void display()
  {
    float num = getNumber(curYear);
    background(255);
    
    pushMatrix();
    translate(100, 100);
    
    int curX = 0;
    int curY = 0;
    int spacing = 3;
    int maxY = 0;
    
    noStroke();
    fill(0, 0, 0);
    text("m2 per citizen: " + PApplet.parseInt(num), 0, -20);
    
    strokeWeight(2);
    fill(0xff222222);
    
    for(int i = 0; i < num; i++)
    {
      rect(curX, curY, diameter, diameter);
      //line(curX, curY, curX, curY + diameter);
       
      curX += diameter + spacing;
      
      if(curX >= gridWidth)
      {
        curX = 0;
        curY += diameter + spacing;
      }
      
      if(curY > maxY)
      {
         maxY = curY; 
      }
    }
    
    /*for(int i = 0; i < gridWidth; i += 20)
    {
        if(i < curX)
        {
           line(i, 0, i, curY);
           // draw full to curY
        }
        else
        {
           line(i, 0, i, curY - (diameter + spacing));
        } 
    }*/
   
    /*float r = 0.1;
    float theta = 0;
    float rm = .20f;
    
    noFill();
    stroke(#454a1a);
    
    for(int i = 0; i < getNumber(curYear); i++)
    {
      // Polar to Cartesian conversion
      float x = r * cos(theta);
      float y = r * sin(theta);
    
      // Draw an ellipse at x,y
      noStroke();
      fill(0);
      ellipse(x, y, 10, 10); 
      
      // Increment the angle
      
      theta += 0.05 * 500/r;
     
      // Increment the radius
      rm -=  0.001f;
      r += rm;
    }*/
    
    popMatrix();
    fill(0, 0, 0);
    text("Current Year: " + curYear, 10, 20);
  }
  
  /*  Calc number between 2 data points
  ___________________________________________________________ */
  
  public float getNumber(int selectedYear)
  {
    int lowYear = 0;
    float lowNum = 0;
    float highNum = 0;
    int highYear = 99999;
    
    for(int i = 0; i < years.length; i++)
    { 
       if(years[i] > lowYear && years[i] <= selectedYear)  
       {
         lowYear = years[i];
         lowNum = data[data.length - 1][i];
       }
       
       if(years[i] < highYear && years[i] >= selectedYear)
       {
         highYear = years[i];
         highNum = data[data.length - 1][i];
       }
    }
    
    float num;
    
    if(lowYear == highYear)
    {
        num = lowNum;
    }
    else
    {
       float percentage = PApplet.parseFloat(selectedYear - lowYear) / PApplet.parseFloat(highYear - lowYear);
       num = ((highNum - lowNum) * percentage) + lowNum;
    }
    
    //return num * 1000000; // convert to square meters
    
    return num * 100000; // convert to square meters
  }
  
  /*  Mouse Pressed
  ___________________________________________________________ */
  
  public void setYear(int year)
  {
    curYear = year;
  }
  
  public String getTitle()
  {
     return "Habitat title stuff here"; 
  }
  
  public boolean setCountry(String countryCode)
  {
    return false; 
  }
}
class Circle {
  public float x, y, radius, inner;
  public int myColor;
  
  public Circle(float x, float y, float radius, float inner) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.inner = inner;
    myColor = color(64,64,64,64);
  }
  
  public void draw() {
    fill(myColor);
    stroke(40);
    strokeWeight(1);
    ellipse((int)x, (int)y, (int)radius*2, (int)radius*2);
    fill(color(100, 100, 40));
    ellipse((int)x, (int)y, (int)inner*2, (int)inner*2);
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



public class FuelConsumptionVisualizer extends AbstractVisualizer
{
  private HashMap data = new HashMap();
  private int curYear = 2007;
  private String countryCode;
    //  private InterpolateStrategy is=new CircularInterpolation(true);

  public FuelConsumptionVisualizer() {
    parseCsv();
  }
  
  private void parseCsv() {
    String[] lines = loadStrings("fuelConsumption.csv");
    String[] cols = lines[0].split(",");
    int[] years = new int[cols.length-2];
      for (int i = 0; i < years.length; i++) {
      years[i] = Integer.parseInt(cols[i+2]);
    }

    for(int i = 1; i < lines.length; i++) {
      String chunks[] = lines[i].split(",");

      HashMap fuelPerYear = new HashMap(years.length);
      for (int y=0; y < years.length; y++) {
        fuelPerYear.put(years[y], Float.parseFloat(chunks[y+2].length() == 0 ? "0" : chunks[y+2]));
      }

      data.put(chunks[0].trim(), fuelPerYear);
    }
  }

  public void setYear(int year) {
    curYear = constrain(year, 1960, 2007);
  }

  public void display(){
    
  }

  public void display(float total) {
    smooth();
    noStroke();
    
    fill(200, 100, 100);
    

      HashMap hm = (HashMap)data.get("WLD");
      float sum = (Float)hm.get(curYear);
      
    
    rect(0, -(500*sum/total)/2, 20, 500*sum/total);
    text(sum/total + "avg personal fuel consumption in kT of oil equivalent", 30, 0);
   // println(sum);
   
  }

  public String getTitle() {
    return "Fuel Consumption %";
  }

  public boolean setCountry(String countryCode) {
    this.countryCode = countryCode;
    return true;
  }
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
      if (thisYear[i] == 0.0f) continue;
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

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "parse1" });
  }
}
