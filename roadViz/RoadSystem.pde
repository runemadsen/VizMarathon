class RoadSystem {
  // Data source variables
  int[] years;
  int[] roadLength = new int[16]; //[year]
  int targetYear;  

  // Road variables
  Road firstRoad;
  int startRoads = 8;
  int targetLength = 0;
  int xPos, yPos;

  RoadSystem(int _xPos, int _yPos) {
    // Set position
    xPos = _xPos;
    yPos = _yPos;

    // Load the data
    String lines[] = loadStrings("road-length.csv");
    years = subset(int(lines[1].split(",")), 1);  

    // Initialize road length array
    for(int i = 0; i < 16; i++) {
      roadLength[i] = 0;
    }

    // Sum the road values for global picture
    for(int i = 2; i < lines.length; i++) {
      int temp[] = subset(int(lines[i].split(",")), 1);

      for(int j = 0; j < temp.length; j++) {
        roadLength[j] += temp[j];
      }
    }

    // Seed the whole thing with a first road   
    firstRoad = new Road(0, 0, 60, 100);
  }

  int getTotalLength() {
    int totalLength = 0;
    ArrayList<Road> allRoads = getAllRoads();
    for(int i = 0; i < allRoads.size(); i++) {
      totalLength += allRoads.get(i).roadLength;
    }
    return totalLength;
  }

  void addRoad() {
    println("addroad");
    // which one to add to?
    // pick source index from exponential probability from the beginning to end of road list?

    // Set some variables and get the list of roads
    Road tempParent;
    Road tempRoad;
    ArrayList<Road> temp = getAllRoads();
    int randomIndex;    

    // Pick the parent
    // respect parent limits    
    if(firstRoad.children.size() < startRoads) {
      randomIndex = 0;
      tempParent = temp.get(randomIndex);
    }
    else {
      randomIndex = floor(random(1) * random(1) * temp.size());
      tempParent = temp.get(randomIndex);
      while (tempParent.children.size() > tempParent.maxChildren) {
        randomIndex = floor(random(1, temp.size()));
        tempParent = temp.get(randomIndex);
      }
    }

    // Build the road
    tempRoad = new Road(tempParent, tempParent.angle + random(-80, 80), random(50, 70), random(50, 100));        

    if(firstRoad.children.size() < startRoads) {
      tempRoad.setOrigin();
      tempRoad.setRoadAngle(firstRoad.children.size() * 30 + random(-5, 5));
    }

    // make connections now and then
    //    if ((firstRoad.children.size() >= startRoads) && (temp.size() % 5 == 0)) {
    //      println("CONNECTIONCONNECTIONCONNECTIONCONNECTIONCONNECTION");
    //      Road tempConnection = temp.get(randomIndex - 1);
    //      //  Road(Road _parent, Road _connection, float _percent, float _connectionPercent) {      
    //      tempRoad = new Road(tempParent, tempConnection, 50, 50);
    //    }

    tempParent.children.add(tempRoad);
  }


  int tempDepth;
  int getMaxDepth() {
    tempDepth = 0;
    return searchMaxDepth(firstRoad);
  }

  int searchMaxDepth(Road road) {
    tempDepth = max(road.depth, tempDepth);

    for(int i = 0; i < road.children.size(); i++) {
      tempDepth = max(tempDepth, searchMaxDepth(road.children.get(i)));
    }

    return tempDepth;
  }

  void removeRoad() {
    // find the outermost layer
    ArrayList<Road> outerRoads = getRoadsAtDepth(getMaxDepth());

    Road condemnedRoad = outerRoads.get(floor(random(0, outerRoads.size())));
    Road parent = condemnedRoad.parent;
    parent.children.remove(0); // just remove whatever
  }  

  ArrayList<Road> roadsAtDepth;
  ArrayList<Road> getRoadsAtDepth(int targetDepth) {
    roadsAtDepth = new ArrayList();

    if (targetDepth == 0) {
      // Special case for 0 depth
      // It's always the first road
      roadsAtDepth.add(firstRoad);
      return roadsAtDepth;
    }
    else {
      searchRoadsAtDepth(firstRoad, targetDepth);
      return roadsAtDepth;
    }
  }

  ArrayList<Road> getAllRoads() {
    ArrayList<Road> allRoads = new ArrayList();
    searchAllRoads(firstRoad, allRoads);
    return allRoads;
  }

  void searchAllRoads(Road road, ArrayList<Road> accumulator) {
    accumulator.add(road);

    for(int i = 0; i < road.children.size(); i++) {
      searchAllRoads(road.children.get(i), accumulator);
    }
  }

  void searchRoadsAtDepth(Road road, int targetDepth) {
    if(road.depth == targetDepth) roadsAtDepth.add(road);  

    for(int i = 0; i < road.children.size(); i++) {
      searchRoadsAtDepth(road.children.get(i), targetDepth);
    }
  }

  Road pickSemiRandomRoad() {
    // bias towards the end?

    int randomDepth;
    if(firstRoad.children.size() == 0) {
      randomDepth = 0;
    }
    else {
      randomDepth = ceil((random(1) * getMaxDepth()));
    }


    println("Random depth: " + randomDepth);
    println("Max depth: " + getMaxDepth());    
    ArrayList roadsAtDepth = getRoadsAtDepth(randomDepth);
    println(roadsAtDepth);

    int randomIndex = floor(random(0, roadsAtDepth.size()));

    return (Road)roadsAtDepth.get(randomIndex);
  }

  void setYear(int _y) {
    targetYear = constrain(_y, 1970, 2005);

    println("Trying to go to year: " + targetYear);

    int yearIndex = 0;
    int minDistance = 1000000;
    for(int i = 0; i < years.length; i++) {
      int tempDistance = abs(years[i] - targetYear);
      if(tempDistance < minDistance) {
        minDistance = tempDistance;
        yearIndex = i;
      }
    }

    println("Year Index: " + yearIndex);    

    targetLength = roadLength[yearIndex];
    println("Target Length: " + targetLength);
  }
  
  
  void center(){

     ArrayList<Road> allRoads = getAllRoads();
    int minX;
    int minY;
    int maxX;
    int maxY;
    for(int i = 0; i < allRoads.size(); i++) {
      Road tempRoad = allRoads.get(i);
      if(tempRoad.x1 > maxX) {
        maxX = tempRoad.x1;
      }
      if(tempRoad.x1 < minX) {
        tempRoad.x1 = minX;
      }
      if(tempRoad.y1 > maxY) {
        maxY = tempRoad.y1;
      }
      if(tempRoad.y1 < minY) {
        tempRoad.y1 = minY;
      }
    }   
    translate(maxX-minX, maxY-minY);

  }

  // TODO set highway percent

  void display() {    
    // Draw
    pushMatrix();
    translate(xPos, yPos);
    firstRoad.display();
    popMatrix();

    // Maintain length
    int totalLength = getTotalLength();
    if (totalLength < targetLength) {
      addRoad();
    }
    else if(totalLength > (targetLength + 100)) {
      removeRoad();
    }
  }
}


class Road {
  ArrayList<Road> children;
  Road parent;
  Road connection;
  float x1, y1, x2, y2, angle, roadLength;
  float thickness = 2.5;
  float parentPercent = 100; // where on the connection line we intersect
  float connectionPercent = 0;
  int depth = 0;
  int maxChildren = 1;
  boolean isOrigin = false; 

  // Initial constructor
  Road(float _x1, float _y1, float _angle, float _roadLength) {
    parent = null;
    connection = null;
    println("parent constructor");
    children = new ArrayList();
    x1 = _x1;
    y1 = _y1;
    roadLength = _roadLength;
    angle = _angle;

    // figure out x2 and y2 from angle and size
    x2 = x1 + (cos(radians(angle)) * roadLength);
    y2 = y1 + (sin(radians(angle)) * roadLength);
  }

  // Child constructor
  Road(Road _parent, float _angle, float _roadLength, float _parentPercent) {
    println("child constructer");
    parent = _parent;
    connection = null;    
    children = new ArrayList();
    roadLength = _roadLength;
    angle = _angle;
    parentPercent = _parentPercent; 
    depth = parent.depth + 1;
    calculateLine();
  }

  // Connection constructor
  Road(Road _parent, Road _connection, float _percent, float _connectionPercent) {
    println("connection constructor");
    parent = _parent;
    connection = _connection;
    connectionPercent = _connectionPercent;
    children = new ArrayList();
    calculateLine();
  }

  void setOrigin() {
    // force this segment to grow from the origin
    isOrigin = true;
    calculateLine();
  }

  int count = 0;  
  int getChildCount() {
    count = 0;  
    searchChildCount(this);
    return count;
  }

  void searchChildCount(Road road) {
    count++;

    for(int i = 0; i < road.children.size(); i++) {
      searchChildCount(road.children.get(i));
    }
  }

  void calculateLine() {
    // TODo get rid of the global roadSystem here
    if((parent == null) || isOrigin) {
      x1 = 0;
      y1 = 0;
    }
    else {
      x1 = parent.x1 + (cos(radians(parent.angle)) * parent.roadLength * (parentPercent / 100));
      y1 = parent.y1 + (sin(radians(parent.angle)) * parent.roadLength * (parentPercent / 100));
    }

    x2 = x1 + (cos(radians(angle)) * roadLength);
    y2 = y1 + (sin(radians(angle)) * roadLength);

    // must be a connection
    if(connection != null) {
      // find point on the parent
      x1 = parent.x1 + (cos(radians(parent.angle)) * parent.roadLength * (parentPercent / 100));
      y1 = parent.y1 + (sin(radians(parent.angle)) * parent.roadLength * (parentPercent / 100));    

      // find point on connection
      x2 = connection.x1 + (cos(radians(connection.angle)) * connection.roadLength * (connectionPercent / 100));
      y2 = connection.y1 + (sin(radians(connection.angle)) * connection.roadLength * (connectionPercent / 100));

      // derrive the angle and length after the fact
      angle = degrees(atan((connection.y2 - connection.y1) / (connection.x2 - connection.x1)));
      roadLength = dist(x1, y1, x2, y2);
    }

    // recurse as necessarry
    for(int i = 0; i < children.size(); i++) {
      children.get(i).calculateLine();
    }
  }

  void setRoadLength(float _roadLength) {
    roadLength = _roadLength;

    // recalculate self and children
    calculateLine();
  }

  void setRoadAngle(float _angle) {
    angle = _angle;

    // recalculate self and children
    calculateLine();
  }

  void display() {
   

    // Draw

    strokeWeight(thickness); // TODO highway related thickness
    strokeCap(SQUARE);
    smooth();

    stroke(map(depth, 0, 5, 0, 20));
    if(connection != null) stroke(255, 0, 0); // TODO fix connections

    line(x1, y1, x2, y2);

    // Recursively draw all children
    for(int i = 0; i < children.size(); i++) {
      children.get(i).display();
    }

  }
}

