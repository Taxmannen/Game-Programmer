class Human extends Creature
{
	public Human() 
	{
		super();
		size = (int)random(5, 10);
	}

	void draw() 
	{
		fill(255, 0, 0);
		super.draw();
	}
}