class Zombie extends Creature
{
	public Zombie() 
	{
		super();
		velocity.x = velocity.x / 4;
		velocity.y = velocity.y / 4;
	}

	public Zombie(float x, float y) 
	{
		super();
		position.x = x;
		position.y = y;
		velocity.x = velocity.x / 4;
		velocity.y = velocity.y / 4;
	}

	void draw() 
	{
		fill(0, 255, 0);
		super.draw();
	}
}