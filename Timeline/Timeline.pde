TimeBar bar;

void setup()
{
  size(1440, 900);
  smooth();
  
  bar = new TimeBar();
  bar.setLocation(0, 800);
}

void draw()
{
  background(#f9f5ef);
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
}


