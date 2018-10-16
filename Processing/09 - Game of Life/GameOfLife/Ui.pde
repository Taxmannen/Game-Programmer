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
		if (getButtonDown("Clear")) 
		{ 
			for (int y = 0; y < numberOfRows; y++) 
			{
				for (int x = 0; x < numberOfColums; x++) 
				{
					cells[x][y] = new GameObject(new PVector(x * cellSize, y * cellSize), new PVector(x, y), cellSize);
					cells[x][y].alive = false;
					cells[x][y].dead = false;
				}
			}
		}
	}

	void draw() 
	{
		translate(0, height - 15);
		textSize(16);
		textAlign(CENTER);
	
		fill(0);
		rect(0, -35.5, width, 2);
		
		text("[R] Restart", width/2, -15);
		text("[W] Speed:" + displaySpeed + " [S]", 100, -15);
		text("[A] Spawnrate:" + fillPercentage + " [D]", width - 100, -15);

		text("[C] Clear Board", width/2, 10);
		text("[Left Mouse] Spawn", 100, 10);
		text("[Right Mouse] Kill", width - 100, 10);
	}
}