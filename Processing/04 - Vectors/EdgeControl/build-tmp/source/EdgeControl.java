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

public class EdgeControl extends PApplet {

PVector position = new PVector(width/2, height/2);
float speed = 2.8f;
int size = 10;
int xDir = 1;
int yDir = 1;

public void setup() 
{
	
	strokeWeight(size);
}

public void draw() 
{
	background(255);
  	position = new PVector(position.x + (speed * xDir), position.y + (speed * yDir));
  	if (position.x > width  - (size/2) || position.x < (size/2)) xDir *= -1;
  	if (position.y > height - (size/2) || position.y < (size/2)) yDir *= -1;
  	point(position.x, position.y);
}
  public void settings() { 	size(700, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "EdgeControl" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
