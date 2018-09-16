void setup() 
{
	size (720, 480);
  	strokeWeight(10);
}

void draw()
{
	background(255);
	drawCircle(50, 100);
}

void drawCircle(int circleCount, int radius)  
{
	float angle = TWO_PI/circleCount;
	for (int i = 0; i < circleCount; i++) point((width/2) + radius*sin(angle*i), (height/2) + radius*cos(angle*i));
}