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

int ANIMAX = 5000;

gmslModule gm;
co2RegModule co2;
ppmModule ppm;

TemperatureVisualizer tempViz;
FuelConsumptionVisualizer fuelViz;
RoadSystem roadSys;

// in sqkm
final float EARTH_SUR = 148940000.0f;

PFont silk8;
PFont helvetica;

ArrayList circless;
long iterationCounter = 0;

TimeBar bar;

PVector seatemp, planet, roads, habitat, stats;
float animationCounter = .0f;
String active = "a", lastactive = "a";

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
          data[i][j] = float(spl[j]); 
          dataoil[i][j] = float(sploil[j]);
         // print(data[i][j] + " _ ");
       }
       //println();
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
  stroke(#3a69a5);
  strokeWeight(2);
  
  fill(#c7d4e3);
  float d = 2*r + 2*gmsl[min(curYearIndex, 50)]/4;
 // ellipse(width/2, height/2, d, d);
  for(int i = 0; i < 12; i++)
  {
     float val = 2.5*r + 2*gmsl_raw[min(curYearIndex, 50)*12+i]/4;
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
  helvetica = loadFont("Helvetica-Bold-48.vlw"); 
  textFont(silk8);
  
  bar = new TimeBar();
  bar.setLocation(0, 850);
  
  //h = new Habitat();
  
  gm = new gmslModule();
  co2 = new co2RegModule();
  ppm = new ppmModule();
  tempViz = new TemperatureVisualizer();
  fuelViz = new FuelConsumptionVisualizer();
  roadSys = new RoadSystem(0, 0);
  
  active = "roads";
  int xoff = 150;
  roads = new PVector(135, height / 8);
  seatemp = new PVector(160f, 410);
  //habitat = new PVector(95, 3*height/5);
  planet = new PVector(xoff, 680);
  
 // controlP5 = new ControlP5(this);
 // s = controlP5.addSlider("sliderVal",1950,2049,100,height-100,width-200,10);
  //s.setId(1);
 // s.setArrayValue(new float[] {0, 100});  

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
  
 circless = createPackC(); 
}

void update()
{
 // println(sliderVal);
  
  sliderVal = bar.getYear();
  curYearIndex = sliderVal - 1950;
  
}

ArrayList createPackC()
{
  println("PACK");
  ArrayList circles = new ArrayList();
  //colorMode(HSB, 255);
  
    for(int i = 0; i < co2.data.length; i++)
  {
    int ind = 0;
    if(sliderVal >= 1971)
      ind = sliderVal - 1971;
     
     float rc = sqrt(co2.data[i][min(ind, 37)]/PI);
     
     Circle c = new Circle(width/2 + 100 * cos(i * 2*PI/co2.data.length), height/2-100*sin(i * 2*PI/co2.data.length),  rc, sqrt(co2.dataoil[i][min(ind, 37)]/PI));
     c.myColor = color(200, 200, 100);
     circles.add(c);
    
  }
  
  //colorMode(RGB,255);
  return circles;
}

void draw()
{
  update();
  
  textFont(silk8);
  
  background(#f9f5ef);
  
  animationCounter -= 600.0f;
  if(animationCounter <= 0) animationCounter = .0f;
  
   PVector cent = new PVector(width/2, height/2);
    
  /*pushMatrix();
  if(active.equals("habitat") && animationCounter == .0f)
  {
    translate(width/2, height/2);
  } 
  else if (!active.equals("habitat") && animationCounter == .0f || !lastactive.equals("habitat") && !active.equals("habitat") && animationCounter > .0f)
  {
    translate(habitat.x, habitat.y);
    scale(.45f);
  } 
  else if (lastactive.equals("habitat") && !active.equals("habitat") && animationCounter > .0f) 
  {
    PVector v = PVector.add(habitat, (PVector.mult(PVector.sub(cent, habitat), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, .45f, 1.0f));
  } 
  else if (active.equals("habitat") && animationCounter > .0f)
  {
      PVector v = PVector.add(cent, (PVector.mult(PVector.sub(habitat, cent), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, 1.0f, 0.45f));
  }
  h.setYear(sliderVal);
  h.display();
  popMatrix();*/
  
 // noStroke();
  
  float space_sqm = 1000000 * EARTH_SUR / total[curYearIndex];
  
  float r = sqrt(space_sqm/PI);
 // println(r);
 

 
  // ROADS
  pushMatrix();
  if(active.equals("roads") && animationCounter == .0f)
  {
    translate(width/2, height/2);
  } 
  else if (!active.equals("roads") && animationCounter == .0f || !lastactive.equals("roads") && !active.equals("roads") && animationCounter > .0f)
  {
    translate(roads.x, roads.y);
    scale(.35f);
  } 
  else if (lastactive.equals("roads") && !active.equals("roads") && animationCounter > .0f) 
  {
    PVector v = PVector.add(roads, (PVector.mult(PVector.sub(cent, roads), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, .35f, 1.0f));
  } 
  else if (active.equals("roads") && animationCounter > .0f)
  {
      PVector v = PVector.add(cent, (PVector.mult(PVector.sub(roads, cent), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, 1.0f, 0.35f));
  }
  roadSys.setYear(sliderVal);
  roadSys.display();
  popMatrix();
  
  
  pushMatrix();
  
  // active
  if(active.equals("planet") && animationCounter == .0f)
  {
    translate(width/2, height/2);
  } 
  // not active
  else if (!active.equals("planet") && animationCounter == .0f || !lastactive.equals("planet") && !active.equals("planet") && animationCounter > .0f)
  {
    translate(planet.x, planet.y);
    scale(.80f);
  } 
  // shrinking
  else if (lastactive.equals("planet") && !active.equals("planet") && animationCounter > .0f) 
  {
    PVector v = PVector.add(planet, (PVector.mult(PVector.sub(cent, planet), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, .80f, 1.0f));
  } 
  // growing
  else if (active.equals("planet") && animationCounter > .0f)
  {
      PVector v = PVector.add(cent, (PVector.mult(PVector.sub(planet, cent), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, 1.0f, 0.80f));
  }
  // PLANET
  
  strokeWeight(2);
  stroke(color(40));
  fill(color(240));
  ellipse(0, 0, 2*r, 2*r);
  noStroke();
  fill(40);
  text(space_sqm + " square meters of land mass per person (1 pixel = 1 square meter)", r+50, 0);
  
  
    // CIRCLE PACKING
  pushMatrix();
  translate(-width/2, -height/2);
  for (int i=0; i<circless.size(); i++) {
    ((Circle)circless.get(i)).draw();
    fill(color(30));
    text(co2.regions[i], ((Circle)circless.get(i)).x, ((Circle)circless.get(i)).y); 
  } 
  for (int i=1; i<50; i++) {
    iterateLayout(i);
  }
  popMatrix();
  
  popMatrix();
  
  
   // GMSL  
   
  pushMatrix();
  
  
 if(active.equals("seatemp") && animationCounter == .0f)
 {
    translate(width/2, height/2);
  } 
  else if (!active.equals("seatemp") && animationCounter == .0f  || !lastactive.equals("seatemp") && !active.equals("seatemp") && animationCounter > .0f)
  {
    translate(seatemp.x, seatemp.y);
    scale(.45f);
  } 
  else if (lastactive.equals("seatemp") && !active.equals("seatemp") && animationCounter > .0f) 
  {
     PVector v = PVector.add(seatemp, (PVector.mult(PVector.sub(cent, seatemp), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, .45f, 1.0f));
  } 
  else if (active.equals("seatemp") && animationCounter > .0f)
  {
      PVector v = PVector.add(cent, (PVector.mult(PVector.sub(seatemp, cent), animationCounter/float(ANIMAX))));
     translate( v.x, v.y );
     scale( map(animationCounter, 0, ANIMAX, 1.0f, 0.45f));
  }
  
 
 // scale(1.5f);
  
  gm.display(100);
  fill(color(255));
  ellipse(0, 0, 200, 200);

  pushMatrix();
  
  fill(color(10));
  ellipse(0, 0, 280, 280);
  popMatrix();
  
  // TEMP
  tempViz.setYear(min(sliderVal, 2010));
  pushMatrix();

  tempViz.display();
  popMatrix();
  
  noStroke();
  noFill();
 
  colorMode(RGB, 255);
  
  textFont(helvetica, 10);
  
  pushMatrix();
  pushMatrix();
  scale(.95f);
  String mon[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
  for(int i = 0; i < 12; i++)
  {
     pushMatrix();
     scale(.95f);
     rotate((i-2) * PI/6.0f - PI/12.0f);
     translate(135, 0);
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
  displayAtmos(150);
  popMatrix();
  
  popMatrix();

  
  // FUEL
  /*
  fuelViz.setYear(sliderVal);
  pushMatrix();
  translate(width/2 + 50, 100);
  fuelViz.display(total[curYearIndex]);
  popMatrix();
  */
  
  float co2sum = .0f;
  
  for(int i = 0; i < co2.data.length; i++)
  {
    int ind = 0;
    if(sliderVal >= 1971)
      ind = sliderVal - 1971;
      
     co2sum += co2.data[i][min(ind, 37)];
     
     float rc = sqrt(co2.data[i][min(ind, 37)]/PI);
  }

  
  // PERSONAL PPM
  /*
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
  */
  
  bar.display();
 
  
}

void mousePressed()
{
   bar.checkPress(); 
}

void mouseReleased()
{
  bar.stopDrag();
}

void mouseDragged()
{
  println("Mouse moved");
  bar.checkDrag(); 
  if(true || bar.dragging)
  {
    circless = createPackC();
  }
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

  Object circs[] = circless.toArray();
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

void keyPressed()
{
  lastactive = active;
   if(key == '1'){
      active = "roads";
      animationCounter = ANIMAX;
   } else if (key == '3'){
      active = "planet"; 
      animationCounter = ANIMAX;
   } else if (key == '2'){
      active = "seatemp"; 
      animationCounter = ANIMAX;
   } 
   /*else if (key == '3'){
      active = "habitat"; 
      animationCounter = ANIMAX;
   }*/
   
  
   
}


/*
void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {
    case(1):
     circles = createPackC(); 
    break;
  }
}
*/

