import processing.core.PApplet;


public class TimsVisualization extends PApplet {
	MyClass myClass;
	public void setup()
	{
		size(800,600);
	   myClass = new MyClass(this);
	}

public	void draw()
	{
	  myClass.display();
	  noLoop();
	}


}
