import controlP5.*;

ControlP5 controlP5;
Slider s;

String lines[];
int yr[];
float total[], plus[];
float rate[];

int sliderVal = 1950;

int curYearIndex = 0;

gmslModule gm;
co2RegModule co2;
ppmModule ppm;

// in sqkm
final float EARTH_SUR = 148940000.0f;

PFont silk8;


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
}

void setup()
{
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(1024, 768);
  background(255);
  smooth();
  
  silk8 = loadFont("Silkscreen-8.vlw"); 
  
  gm = new gmslModule();
  co2 = new co2RegModule();
  ppm = new ppmModule();
  
  controlP5 = new ControlP5(this);
  s = controlP5.addSlider("sliderVal",1950,2049,100,height-100,width-200,10);
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
}

void update()
{
 // println(sliderVal);
  
  
  curYearIndex = sliderVal - 1950;
}

void draw()
{
  update();
  
  background(255);
  
 // noStroke();
  
  
  float space_sqm = 1000000 * EARTH_SUR / total[curYearIndex];
  
  float r = sqrt(space_sqm/PI);
 // println(r);
  
  // GMSL
  noStroke();
  
  fill(color(100, 100, 200));
  ellipse(width/2, height/2, 2*r + 2*gm.gmsl[min(curYearIndex, 50)]/4, 2*r + 2*gm.gmsl[min(curYearIndex, 50)]/4);
  
  

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
  line(width/2 + cos(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), height/2 - sin(PI/3) * (r + ppm.data[min(ppmind, 29)]/4.0f), width/2 + cos(PI/3) * 1.3 *(r + ppm.data[min(ppmind, 29)]/4.0f), height/2 - sin(PI/3) * 1.3 * (r + ppm.data[min(ppmind, 29)]/4.0f));
  fill(color(40));
  noStroke();
  
  text(ppm.data[min(ppmind, 29)] + " parts per million CO2 concentration", width/2 + cos(PI/3) * 1.3 *(r + ppm.data[min(ppmind, 29)]/4.0f), height/2 - sin(PI/3) * 1.3 * (r + ppm.data[min(ppmind, 29)]/4.0f));
  
  noFill();
  stroke(color(255, 20, 20));
  ellipse(width/2, height/2, 2*r + 350.0f/2.0f, 2*r + 350.0f/2.0f);
  line(width/2 + cos(PI/3.5f) * (r + 350.0f/4.0f), height/2 - sin(PI/3.5f) * (r + 350.0f/4.0f), width/2 + cos(PI/3.5f) * 1.3 *(r + 350.0f/4.0f), height/2 - sin(PI/3.5f) * 1.3 * (r + 350.0f/4.0f));
  fill(color(40));
  noStroke();
  
  text(350.0f + " boundary CO2 parts per million.", width/2 + cos(PI/3.5f) * 1.3 *(r + 350.0f/4.0f), height/2 - sin(PI/3.5f) * 1.3 * (r + 350.0f/4.0f));
  
  

  
  textFont(silk8);
  for(int i = 0; i < co2.data.length; i++)
  {
    int ind = 0;
    if(sliderVal >= 1971)
      ind = sliderVal - 1971;
    
    pushMatrix();
    translate(width/2 + r * cos(i * 2*PI/co2.data.length), height/2-r*sin(i * 2*PI/co2.data.length));
    fill(color(200, 200, 50));
    ellipse(0, 0, .02 * co2.data[i][min(ind, 37)],  .02 * co2.data[i][min(ind, 37)]);
    fill(color(30));
    text(co2.regions[i], 0, 0); 
    popMatrix();
  }
 
  
}

