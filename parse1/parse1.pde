String lines[];
int yr[];
float total[], plus[];
float rate[];

void setup()
{
  ellipseMode(CENTER);
  size(1024, 768);
  background(255);
  smooth();
  
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
     
     noStroke();
     fill(color(50));
     rect(i * 10, height-total[i]/20000000.0f, 3, total[i]/20000000.0f);
     fill(color(100));
     rect(i * 10 + 3, height-plus[i]/2000000.0f, 3, plus[i]/2000000.0f);
     fill(color(10));
     
     if(i%10==7)
       ellipse(i * 10, 100, total[i]/200000000.0f, total[i]/200000000.0f);
     
  }
}

void draw()
{
  
}
