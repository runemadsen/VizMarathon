RoadSystem roadSystem;

void setup() {
  size(1440, 900);

  // Set the X / Y in the constructor
  roadSystem = new RoadSystem(width / 2, height / 2);
}

void draw() {
  background(255);
  roadSystem.setYear(round(map(mouseX, 0, width, 1950, 2050)));
  roadSystem.display();
}
