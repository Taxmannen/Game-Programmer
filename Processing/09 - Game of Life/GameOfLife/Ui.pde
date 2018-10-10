class Ui 
{
	int displaySpeed = 50;
	int speed = 50;

	void update() 
	{
		inputManager();
		draw();
		speed = 100 - (displaySpeed/2);
	}

	void inputManager() 
	{
		if (getAxisRaw("Vertical") != 0) 
		{
			if (getAxisRaw("Vertical") < 0 && displaySpeed < 100) displaySpeed += 1; 
			if (getAxisRaw("Vertical") > 0 && displaySpeed > 1)   displaySpeed -= 1;
		}

		if (getAxisRaw("Horizontal") != 0) 
		{
			if (getAxisRaw("Horizontal") < 0 && fillPercentage > 1)   fillPercentage -= 1;
			if (getAxisRaw("Horizontal") > 0 && fillPercentage < 100) fillPercentage += 1;
		}
		if (getButtonDown("Restart")) startup();
	}

	void draw() 
	{
		translate(width/2, height - 15);
		textSize(20);
		textAlign(CENTER);

		fill(255);
		rect(-width/2, -25, width, 50);

		fill(0);
		text("R to restart", -175, 0);
		text("Speed:" + displaySpeed, 0, 0);
		text("Spawnrate:" + fillPercentage, 175, 0);
		rect(-width/2, -36, width, 5);
	}
}