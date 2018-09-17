PVector position = new PVector(width/2, height/2);
float speed = 2.8;
int size = 10;
int xDir = 1;
int yDir = 1;

void setup() 
{
	size(700, 500);
	strokeWeight(size);
}

void draw() 
{
	background(255);
  	position = new PVector(position.x + (speed * xDir), position.y + (speed * yDir));
  	if (position.x > width  - (size/2) || position.x < (size/2)) xDir *= -1;
  	if (position.y > height - (size/2) || position.y < (size/2)) yDir *= -1;
  	point(position.x, position.y);
}