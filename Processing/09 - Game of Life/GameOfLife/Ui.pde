class Ui 
{
	int displaySpeed = 25;
	int speed = 25;

	void update() 
	{
		inputManager();
		draw();
		speed = 100 - (displaySpeed - 2);
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
		translate(0, height - 15);
		textSize(17.5);
		textAlign(CENTER);

		fill(0);
		text("[R] Restart", width/2, 0);
		text("[W] Speed:" + displaySpeed + " [S]", 100, 0);
		text("[A] Spawnrate:" + fillPercentage + " [D]", width - 100, 0);
		rect(0, -36, width, 2);
	}
}