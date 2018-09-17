PVector previousPosition = new PVector(0, 0);
PVector position = new PVector(0, 0);
float speed = 0.05;

void setup() 
{
	size (700, 500);
  	strokeWeight(5);
}

void draw() 
{
	background(255);
	followMousePointer();
}

void followMousePointer() 
{
	float x = (1 - speed) * previousPosition.x + speed * mouseX;
	float y = (1 - speed) * previousPosition.y + speed * mouseY;

  	position = new PVector(x, y);
	previousPosition = new PVector(position.x, position.y);
	point(position.x, position.y);
}