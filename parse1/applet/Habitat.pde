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
        years[i - 1] = int(tempyears[i]);
    }
   
    countries = new String[rows.length - 1];
    data = new float[rows.length - 1][5];
  
    for(int i = 1; i < rows.length; i++)
    {
      String columns[] = rows[i].split(",");
      
      countries[i - 1] = columns[0]; 
      data[i - 1][0] = float(columns[1]) / 1000;
      data[i - 1][1] = float(columns[2]) / 1000;
      data[i - 1][2] = float(columns[3]) / 1000;
      data[i - 1][3] = float(columns[4]) / 1000;
      data[i - 1][4] = float(columns[5]) / 1000; 
    }
  }
  
  /*  Draw
  ___________________________________________________________ */
  
  void display()
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
    text("m2 per citizen: " + int(num), 0, -20);
    
    strokeWeight(2);
    fill(#222222);
    
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
  
  float getNumber(int selectedYear)
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
       float percentage = float(selectedYear - lowYear) / float(highYear - lowYear);
       num = ((highNum - lowNum) * percentage) + lowNum;
    }
    
    //return num * 1000000; // convert to square meters
    
    return num * 100000; // convert to square meters
  }
  
  /*  Mouse Pressed
  ___________________________________________________________ */
  
  void setYear(int year)
  {
    curYear = year;
  }
  
  String getTitle()
  {
     return "Habitat title stuff here"; 
  }
  
  boolean setCountry(String countryCode)
  {
    return false; 
  }
}
