class Zombie extends Creature
{
	int armLength = 15;
	public Zombie() 
	{
		super();
		velocity.x = velocity.x / 4;
		velocity.y = velocity.y / 4;
		size = 10;
	}

	public Zombie(float x, float y) 
	{
		super();
		position.x = x;
		position.y = y;
		velocity.x = velocity.x / 4;
		velocity.y = velocity.y / 4;
		size = 10;
	}

	void draw() 
	{
		drawArms();
		fill(0, 255, 0);
		super.draw();
	}

	void drawArms()
	{
  		pushMatrix();
  		translate(position.x, position.y);
  		rotate(velocity.heading());
  		line(-2.5, -2.5, armLength, -2.5);
  		line(-2.5, 2.5, armLength, 2.5);
  		popMatrix();
	}
}