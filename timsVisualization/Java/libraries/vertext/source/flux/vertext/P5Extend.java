package flux.vertext;

import javax.media.opengl.GL;

import processing.core.*;
import processing.opengl.PGraphicsOpenGL;

public class P5Extend {
	
	/*
		 ______ _______ _______                             _ 
		(_____ (_______|_______)        _                  | |
		 _____) )_____  _____   _   _ _| |_ _____ ____   __| |
		|  ____(_____ \|  ___) ( \ / |_   _) ___ |  _ \ / _  |    :3
		| |     _____) ) |_____ ) X (  | |_| ____| | | ( (_| |
		|_|    (______/|_______|_/ \_)  \__)_____)_| |_|\____|
	 */
	
	protected static PApplet p;
	protected static GL gl;
	
	static float widthHalf;
	static float heightHalf;
	
	public static void register(PApplet p){
		P5Extend.p = p;
		gl=((PGraphicsOpenGL)p.g).gl;
		
		widthHalf = p.width / 2;
		heightHalf = p.height / 2;		
	}
	
	public void println(Object o){
		PApplet.println(o);
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	//  @GL Wrappers for Processing (LOL)
	/////////////////////////////////////////////////////////////////////////////////
	public void pushMatrix(){
		gl.glPushMatrix();
	}
	
	public void popMatrix(){
		gl.glPopMatrix();
	}
	
	public void translate(float x, float y, float z){
		gl.glTranslatef(x, y, z);
	}
	
	public void translate(float x, float y){
		gl.glTranslatef(x, y, 0);
	}
	
	public void rotate(float angle){	
		translate( -widthHalf, -heightHalf);
	  	gl.glRotatef(angle,0,0,1.0f);       
	  	translate(widthHalf, heightHalf);  
	}	
	
	public void scale(float s){
		translate( -widthHalf, -heightHalf);		
		gl.glScalef(s,s,1);
		translate(widthHalf, heightHalf);		
	}
	
	public void scale(float x, float y){
		translate( -widthHalf, -heightHalf);		
		gl.glScalef(x,y,1);
		translate(widthHalf, heightHalf);		
	}	
	
	public void scale(float x, float y, float z){
		translate( -widthHalf, -heightHalf);		
		gl.glScalef(x,y,z);
		translate(widthHalf, heightHalf);		
	}		
}
