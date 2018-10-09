class Ui 
{
	void update() 
	{
		translate(width/2, height - 15);
		textSize(20);
		textAlign(CENTER);

		fill(255);
		rect(-width/2, -25, width, 50);

		fill(0);
		text("R to restart", -100, 0);
		text("Speed " + speed, 100, 0);
		rect(-width/2, -30, width, 5);
	}
}