class Ball 
{
	PVector position = new PVector();
	PVector velocity = new PVector();
	int size = 10;
	color c;

	public Ball() 
	{
		position.x = random(0, width);
		position.y = random(0, height);

		velocity.x = random(10) - 5;
		velocity.y = random(10) - 5;

		int r = (int)random(0, 3);
		if (r == 0) c = color(255, 0, 0);
		if (r == 1) c = color(0, 255, 0);
		if (r == 2) c = color(0, 0, 255);
	}

	void update() 
	{
		position.x += velocity.x;
		position.y += velocity.y;
		screenCheck();
	}

	void draw()
	{
		fill(c);
		ellipse(position.x - size/2, position.y - size/2, size, size);
	}

	void screenCheck() 
	{
		if (position.x > width) position.x = 0;
		else if (position.x < 0) position.x = width;

		if (position.y > height) position.y = 0;
		else if (position.y < 0) position.y = height;
	}	
}