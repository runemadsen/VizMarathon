import controlP5.*;

ControlP5 controlP5;

TemperatureVisualizer tv; 


void setup() {
  size(500,700, P2D);
  frameRate(24);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("slider",1881,2010,2010,0,0,width, 20);
  
  tv = new TemperatureVisualizer();
  
}

void draw() {
  background(0);
  controlP5.draw();
  
  pushMatrix();
  translate(width/2, height/2);
  tv.display();
  popMatrix();
}

void slider(float yr) {
  tv.setYear((int)yr);
}



