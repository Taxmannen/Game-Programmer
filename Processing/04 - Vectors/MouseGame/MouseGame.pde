PVector goalPosition;
PVector position;
boolean pressed;
int size = 10;

void setup() 
{
	size(700, 500);
	strokeWeight(size);
	startup();
}

void draw() 
{
	if (mousePressed && !pressed) pressButton();
	if (keyPressed && !mousePressed && pressed) startup();	
}

void startup() 
{
	position = new PVector(0, 0);
	goalPosition = new PVector(random(width - size), random(height - size/2));
	background(255);
	stroke(255, 0, 0);
	point(goalPosition.x, goalPosition.y);
	pressed = false;
}

void pressButton() 
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