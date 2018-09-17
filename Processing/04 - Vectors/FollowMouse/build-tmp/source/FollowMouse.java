import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FollowMouse extends PApplet {

PVector previousPosition = new PVector(0, 0);
PVector position = new PVector(0, 0);
float speed = 0.05f;

 public void setup() 
{
	
  	strokeWeight(5);
}

public void draw() 
{
	background(255);
	followMousePointer();
}

public void followMousePointer() 
{
	float x = (1 - speed) * previousPosition.x + speed * mouseX;
	float y = (1 - speed) * previousPosition.y + speed * mouseY;

  	position = new PVector(x, y);
	previousPosition = new PVector(position.x, position.y);
	point(position.x, position.y);
}
  public void settings() { 	size (700, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FollowMouse" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
