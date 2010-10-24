import processing.app.tools.ColorSelector;
import processing.core.PApplet;



class MyClass extends AbstractVisualizer
{ 
	PApplet p;
	String lines[];
	int data[][];


	public MyClass(PApplet p_)
	{
		this.p = p_;
		lines = p.loadStrings("update87_3.csv");
		data = new int[lines.length][3];
	} 

	void msetYear(int year) 
	{

	}

	void display()
	{
		p.smooth();
		for(String s: lines){
			System.out.println(s);
		}
		for(int i = 0; i < lines.length; i++)
		{
			String[] spl = lines[i].split(",");
			for(int j = 0; j < spl.length; j++)
			{

				try {
					data[i][j] = Integer.valueOf(spl[j]);
					//		          System.out.print(data[i][j] + " _ ");
					System.out.print(data[i][j] + "_");
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			System.out.println("");
		}
		System.out.println(data.length);
		//make circle.
		{
			//fuck that, make a weird-ass ellipse.
			{
				p.pushMatrix();
				{
					p.translate(p.width/2, p.height/2);
					p.ellipseMode(p.CENTER);
					float radianTransition = (2*p.PI)/(data.length);
					float theta = 0;
					for (int i = 0; i < data.length; i++) {
						p.noStroke();
						p.fill(p.color(200,0,150,50));
						p.rotate(theta);
//						p.ellipse(0, 0, data[i][1]*i/50, data[i][2]*i/50);
						p.fill(p.color(0));
						float rectWidth = 5;
						float rectLength1 = data[i][1];
						float rectLength2 = data[i][2];
						p.rectMode(p.CENTER);
						p.rect(0, rectLength1/2, rectWidth, rectLength1);
						p.fill(p.color(100,120,130));
						p.rect(0, rectLength2/2, rectWidth, rectLength2);
						if (rectLength2>rectLength1) {
							System.out.println("true");
							p.fill(p.color(255,0,0));
							p.rect(0,rectLength1+((rectLength2-rectLength1)/2), rectWidth, rectLength2-rectLength1);
						}
						theta += radianTransition;
					}					
				}
				p.popMatrix();
			}
		}
	}

	String getTitle()
	{
		return "My Name";
	}

	boolean setCountry(String countryCode)
	{
		return false;
	}


}

