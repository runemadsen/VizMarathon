import controlP5.*;

ControlP5 controlP5;
Slider s;

String lines[];
int yr[];
float total[], plus[];
float rate[];

int sliderVal = 1950;

int curYearIndex = 0;

// in sqkm
final float EARTH_SUR = 148940000.0f;

void setup()
{
  ellipseMode(CENTER);
  size(1024, 768);
  background(255);
  smooth();
  
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

    println(plus[i]);

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
  
  ellipseMode(CENTER);
  
  noStroke();
  fill(color(40));
  
  float space_sqm = 1000000 * EARTH_SUR / total[curYearIndex];
  
  float r = sqrt(space_sqm/PI);
  println(r);
  
  // draw space in 200 sqm
  ellipse(width/2, height/2, 2*r, 2*r);
  
  rectMode(CENTER);
  
 
  
}

