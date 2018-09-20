Ball[] balls;
void setup() 
{
	size(512, 512);
	balls = new Ball[10];	
	for (int i = 0; i < 10; i++) balls[i] = new Ball();
	//TODO Use tpf to control movement every update
}

void draw() 
{
	background(255);
	for (int i = 0; i < balls.length; i++) 
	{
		balls[i].update();
		balls[i].draw();
	}
}