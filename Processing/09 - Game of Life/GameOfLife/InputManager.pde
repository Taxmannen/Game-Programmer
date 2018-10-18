void inputManager() 
{
	if (getAxisRaw("Vertical") != 0) 
	{
		if (getAxisRaw("Vertical") < 0 && ui.displaySpeed < 100) ui.displaySpeed += 1; 
		if (getAxisRaw("Vertical") > 0 && ui.displaySpeed > 1)   ui.displaySpeed -= 1;
	}

	if (getAxisRaw("Horizontal") != 0) 
	{
		if (getAxisRaw("Horizontal") < 0 && fillPercentage > 1)   fillPercentage -= 1;
		if (getAxisRaw("Horizontal") > 0 && fillPercentage < 100) fillPercentage += 1;
	}
	
	//Hann aldrig komma till användning
	if (getAxisRaw("Zoom") != 0) 
	{
		if (getAxisRaw("Zoom") < 0 && ui.zoom > 1)  ui.zoom -= 1; 
		if (getAxisRaw("Zoom") > 0 && ui.zoom < 10) ui.zoom += 1;
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