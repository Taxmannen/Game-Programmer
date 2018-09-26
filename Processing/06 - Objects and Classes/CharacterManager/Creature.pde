class Creature
{
	PVector position;
	PVector velocity;
	int size;

	public Creature() 
	{
		position = new PVector();
		position.x = random(0, width);
		position.y = random(0, height);

		velocity = new PVector();
		velocity.x = random(-2, 2);
		velocity.y = random(-2, 2);
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
		ellipse(position.x, position.y, size, size);
	}
}