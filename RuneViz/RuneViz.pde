String rows[];
String[] countries;
int years[];
float data[][];
int curYear = 0;
float diameter = 500;

void setup()
{
  size(1024, 768);
  background(255);
  smooth();
  
  rows = loadStrings("oecd-forest-percent.csv");

  //yr = new int[lines.length];
  String tempyears[] = rows[0].split(",");
  years = new int[tempyears.length - 1];

  // remove first row
  for(int i = 1; i < tempyears.length; i++)
  {
      years[i - 1] = int(tempyears[i]);
  }
  
  //years = rows[0].split(",");
  countries = new String[rows.length - 1];
  data = new float[rows.length - 1][5];

  for(int i = 1; i < rows.length; i++)
  {
    String columns[] = rows[i].split(",");
    
    countries[i - 1] = columns[0]; 
    data[i - 1][0] = float(columns[1]) / 100;
    data[i - 1][1] = float(columns[2]) / 100;
    data[i - 1][2] = float(columns[3]) / 100;
    data[i - 1][3] = float(columns[4]) / 100;
    data[i - 1][4] = float(columns[5]) / 100; 
  }
  
  ellipseMode(CENTER);
  
}

void draw()
{
  background(255);
  
  pushMatrix();
  translate(width / 2, height / 2);
  
  // draw 100 percent
  noFill();
  stroke(0, 0, 0);
  strokeWeight(3);
  ellipse(0, 0, diameter, diameter);
  
  // draw year
  fill(#a6b63e);
  noStroke();
  ellipse(0, 0, data[data.length - 1][curYear] * diameter, data[data.length - 1][curYear] * diameter);
  
  popMatrix();
  fill(0, 0, 0);
  text("Current Year: " + years[curYear], 10, 20);
}

void mousePressed()
{
   curYear++; 
}
