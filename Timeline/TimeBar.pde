class TimeBar
{
  PFont font;
  PVector loc = new PVector();
  boolean dragging = false;
  int curYear = 1970;
  
  int curX = 15;
  
  TimeBar()
  {
    font = createFont("Helvetica-Bold-48.vlw", 25);
    textFont(font);
  }
  
  void display()
  {
    noStroke();
    fill(#222222);
    pushMatrix();
    translate(loc.x, loc.y);
    text("1970", 15, 0); 
    text("2010", width - 80, 0);
    
    for(int i = 95; i < width - 90; i += 10)
    {
      ellipse(i, -10, 5, 5);
    }
    
    // draw boc
    fill(#2d2d2d);
    rect(curX, -30, 85, 40);
    
    fill(255);
    text(curYear, curX + 9, 0);
    
    popMatrix();
  }
 
  int getYear()
  {
    return curYear;
  } 
  
 void setLocation(int x, int y)
  {
    loc.x = x;
    loc.y = y;
  }
  
 void checkPress()
  {
    if(mouseX > loc.x + curX && mouseX < loc.x + curX + 85 && mouseY > loc.y - 40 && mouseY < loc.y + 40)
    {
       dragging = true;
    }
  }
  
  void checkDrag()
  {
    if(dragging && mouseX > loc.x + 15 && mouseX < width - 80)
    {
       curX = mouseX; 
       
       curYear = int(map(curX, loc.x, width - 90, 1970, 2010));
    }
  }
  
  void stopDrag()
  {
    dragging = false; 
  }
  
}
