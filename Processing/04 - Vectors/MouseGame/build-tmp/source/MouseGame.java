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

public class MouseGame extends PApplet {

PVector goalPosition;
PVector position;
boolean pressed;
int size = 10;

public void setup() 
{
	
	strokeWeight(size);
	startup();
}

public void draw() 
{
	if (mousePressed && !pressed) pressButton();
	if (keyPressed && !mousePressed && pressed) startup();	
}

public void startup() 
{
	position = new PVector(0, 0);
	goalPosition = new PVector(random(width - size), random(height - size/2));
	background(255);
	stroke(255, 0, 0);
	point(goalPosition.x, goalPosition.y);
	pressed = false;
}

public void pressButton() 
{
	position = new PVector(mouseX, mouseY);

	stroke(0);
	point(position.x, position.y);
	float distance = abs(position.x - goalPosition.x) + abs(position.y - goalPosition.y);

	fill(0);
	textSize(40);
	textAlign(CENTER);
	text("Distance = " + (int)distance, width/2, height/2 - 40);
	text("Press any key to restart!", width/2, height/2 + 40);

	pressed = true;
}
  public void settings() { 	size(700, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MouseGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
