package flux.vertext;


import processing.core.PApplet;
import processing.core.PFont;
import processing.opengl.PGraphicsOpenGL;

public class Vertext extends P5Extend{

	PFont font;
	int fontSize;
	int color;
	public VectorChar vc[] = new VectorChar[255];
	
	public Vertext(String fontFile, int fontSize, int color){
		
		DisplayListManager.attachGL(gl);
		
		font = p.createFont(fontFile, 5);
		p.textFont(font, fontSize);
		
		this.fontSize = fontSize;
		
		this.color = color;		
		
		p.fill(80);

		int pTextMode = p.g.textMode;
		p.textMode(PApplet.SHAPE);		
		for(int i=0; i<vc.length; i++){
			vc[i] = new VectorChar((char) i);
		}
		p.textMode(pTextMode);		
	}
	
	public void text(String text, float x, float y){
		
		((PGraphicsOpenGL)p.g).beginGL();
		
		int pTextMode = p.g.textMode;
		p.textMode(PApplet.SHAPE);
		
		pushMatrix();
		translate(x,y);
		p.textFont(font,fontSize);
		for(int i=0; i<text.length(); i++){
			char cc = text.charAt(i);
			if(cc >= 255)
				cc = 254;
			int ci = (int) text.charAt(i);
			if(ci >= 255)
				ci = 254;
			vc[ci].draw();
			translate(p.textWidth(cc), 0);
		}
		popMatrix();
		
		p.textMode(pTextMode);
		((PGraphicsOpenGL)p.g).endGL();		
	}
	
	public class VectorChar implements DisplayList{
		public char character;
		protected int dlIndex = 0;				
		public VectorChar(char character){
			this.character = character;
			try {
				dlIndex = DisplayListManager.register(this);
			} catch (Exception e) {
				e.printStackTrace();
			}				
		}
		public void preDrawRoutine() {
		}

		public void setDrawRoutine() {
			p.fill(color);			
			p.text(character,0,0);
		}
		
		public void draw(){
			DisplayListManager.display( dlIndex );						
		}
		
	}

}
