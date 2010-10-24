class Circle {
  public float x, y, radius, inner;
  public color myColor;
  
  public Circle(float x, float y, float radius, float inner) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.inner = inner;
    myColor = color(64,64,64,64);
  }
  
  public void draw() {
    fill(myColor);
    stroke(40);
    strokeWeight(1);
    ellipse((int)x, (int)y, (int)radius*2, (int)radius*2);
    fill(color(100, 100, 40));
    ellipse((int)x, (int)y, (int)inner*2, (int)inner*2);
  }
 
 public boolean contains(float x, float y) {
   float dx = this.x - x;
   float dy = this.y - y;
   return sqrt(dx*dx + dy*dy) <= radius;
 }
  
  public float distanceToCenter() {
    float dx = x - WIDTH/2;
    float dy = y - HEIGHT/2;
    return (sqrt(dx*dx + dy*dy));
  } 
  
  public boolean intersects(Circle c) {
    float dx = c.x - x;
    float dy = c.y - y;
    float d = sqrt(dx*dx + dy*dy);
    return d < radius || d < c.radius;
  }
}
