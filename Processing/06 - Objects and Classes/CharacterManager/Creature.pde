class Creature
{
	PVector position;
	PVector velocity;
	int size = 10;

	public Creature() 
	{
		position = new PVector();
		position.x = random(0, width);
		position.y = random(0, height);

		velocity = new PVector();
		velocity.x = random(10) - 5;
		velocity.y = random(10) - 5;
	}

	void update() 
	{	
		position.x += velocity.x;
		position.y += velocity.y;
		screenCheck();
	}

	void screenCheck() 
	{
		if (position.x > width) position.x = 0;
		else if (position.x < 0) position.x = width;

		if (position.y > height) position.y = 0;
		else if (position.y < 0) position.y = height;
	}

	void draw() 
	{
		ellipse(position.x - size/2, position.y - size/2, size, size);
	}
}