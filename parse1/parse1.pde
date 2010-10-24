import controlP5.*;

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
         data[i] = float(lines[i]);
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
          data[i][j] = float(spl[j]); 
          print(data[i][j] + " _ ");
       }
       println();
    }
  
  }
}

void displayAtmos(float r)
{
   noFill();
  
  strokeWeight(2);
  stroke(color(200, 200, 50));
  int ppmind = 0;
  if(sliderVal >= 1980)
      ppmind = sliderVal - 1980;
      
  ellipse(0, 0, 2*r + ppm.data[min(ppmind, 29)]/2.0f, 2*r + ppm.data[min(ppmind, 29)]/2.0f);
  line(cos(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), - sin(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), cos(PI/3) * 1.3 *(r + ppm.data[min(ppmind, 29)]/4.0f), - sin(PI/3) * 1.3 * (r + ppm.data[min(ppmind, 29)]/4.0f));
  fill(color(40));
  noStroke();
  
  text(ppm.data[min(ppmind, 29)] + " parts per million CO2 concentration", cos(PI/3) * 1.3 *(r + ppm.data[min(ppmind, 29)]/4.0f), - sin(PI/3) * 1.3 * (r + ppm.data[min(ppmind, 29)]/4.0f));
  
  noFill();
  stroke(color(255, 20, 20));
  ellipse(0, 0, 2*r + 350.0f/2.0f, 2*r + 350.0f/2.0f);
  line(cos(PI/3.5f) * (r + 350.0f/4.0f),  - sin(PI/3.5f) * (r + 350.0f/4.0f), cos(PI/3.5f) * 1.3 *(r + 350.0f/4.0f), - sin(PI/3.5f) * 1.3 * (r + 350.0f/4.0f));
  fill(color(40));
  noStroke();
  
  text(350.0f + " boundary CO2 parts per million.", cos(PI/3.5f) * 1.3 *(r + 350.0f/4.0f), - sin(PI/3.5f) * 1.3 * (r + 350.0f/4.0f));
  
  
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
    
      yr_raw[i] = int(spl[0].substring(4));
      gmsl_raw[i] = float(spl[1]);
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
  noStroke();
  
  fill(color(180, 180, 220));
  float d = 2*r + 2*gmsl[min(curYearIndex, 50)]/4;
 // ellipse(width/2, height/2, d, d);
  for(int i = 0; i < 12; i++)
  {
     float val = 2*r + 2*gmsl_raw[min(curYearIndex, 50)*12+i]/4;
     //fill(color(180, 180, i*10+50));
     arc(0, 0, val * 2 - 200, val * 2 - 200, i * 2*PI/12 - PI/2 + .01, (i+1) * 2*PI/12 - PI/2 - .01);
  }
  
    fill(color(40));
    noStroke();
    text(gmsl[min(curYearIndex, 50)] + " mm global annual average sea level", r+50, 20);
 }
}

void setup()
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


    yr[i] = int(spl[0]);
    total[i] = float(spl[1]);
    plus[i] = float(spl[3]);
    rate[i] = float(spl[2]);

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

void update()
{
 // println(sliderVal);
  
  
  curYearIndex = sliderVal - 1950;
  
}

ArrayList createPackC()
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

void draw()
{
  update();
  
  background(255);
  
  h.setYear(sliderVal);
  h.display();
  
 // noStroke();
  
  float space_sqm = 1000000 * EARTH_SUR / total[curYearIndex];
  
  float r = sqrt(space_sqm/PI);
 // println(r);
  
  
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
  text(space_sqm + " square meters of land mass per person", r+50, 0);
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
  
  /*
  // FUEL
  fuelViz.setYear(sliderVal);
  pushMatrix();
  translate(width/2, 100);
  fuelViz.display();
  popMatrix();
  */
  
  // ATMOSPHERE PPM
  
  pushMatrix();
  translate(width/4, height/4);
  displayAtmos(100);
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

void mouseReleased()
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

void iterateLayout(int iterationCounter) {

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
        if (d < (r * r) - 0.01 ) {

          v.x = dx;
          v.y = dy;

          v.normalize();
          v.mult((r-sqrt(d))*0.5);

            cj.x += v.x;
            cj.y += v.y;
   
            ci.x -= v.x;
            ci.y -= v.y;       
        }
      }
    }
  }

  //Contract
  float damping = 0.1/(float)(iterationCounter);
  for (int i=0; i<circs.length; i++) {
    Circle c = (Circle)circs[i];
      v.x = c.x-width/2;
      v.y = c.y-height/2;
      v.mult(damping);
      c.x -= v.x;
      c.y -= v.y;
  }
}

ArrayList createRandomCircles(int n) {
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

void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {
    case(1):
     circles = createPackC(); 
    break;
  }
}

