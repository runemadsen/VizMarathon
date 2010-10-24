package flux.vertext;

import javax.media.opengl.GL;

class DisplayListManager {
	
	private static GL gl;
	
	public DisplayListManager(GL gl){
		attachGL(gl);
	}
	
	static public void attachGL(GL gl){
		DisplayListManager.gl = gl;
	}
	
	static public int register(DisplayList routine) throws Exception{
		
		if(gl == null){
//			System.out.println("Display List Manager: you must first use attachGL(gl) before you can register any dispaly lists.");
			System.out.println("Dispaly List Manager: gl is null, make sure you are in OPENGL Mode to use display lists");
			return 0;
		}
		
		try{			  	
			//System.out.println("creating index " + index);
			//set any specifications for drawing
			routine.preDrawRoutine();
  
		    int currentIndex = gl.glGenLists(1);
		    gl.glNewList( currentIndex, GL.GL_COMPILE);
		    routine.setDrawRoutine();
		    gl.glEndList();  
		    
		    //System.out.println(currentIndex);
		    
		    return currentIndex;
		}
		catch(Exception e){
		    System.out.println("Problem with saving diisplay list!");
		    System.out.println( e );
		    return 0;
		}		
	}
	
	static public void display(int listIndex){		
		try{
			//System.out.println("drawing dl " + listIndex);			
			gl.glCallList(listIndex);			
		}
		catch(Exception e){
			if(gl == null){
				System.out.println("Display List Manager: you must first use attachGL(gl) before you can use any dispaly lists.");
			}
			System.out.println(e);
		}
	}
	
	
}
