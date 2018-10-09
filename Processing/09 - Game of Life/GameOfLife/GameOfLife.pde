GameObject cells[][];
float cellSize = 10;
int numberOfColums;
int numberOfRows;
int fillPercentage = 15;
int speed = 50;

void setup() 
{	
	frameRate(30);
	size(512, 512);
	ellipseMode(LEFT);

	numberOfColums = (int)Math.floor(width/cellSize);
	numberOfRows   = (int)Math.floor(height/cellSize);

	startup();
}

void draw() 
{
	if (frameCount % speed == 1) 
	{
		background(255);
		for (int y = 0; y < numberOfRows; y++) 
		{
			for (int x = 0; x < numberOfColums; x++) 
			{ 
				cells[x][y].draw();
				cells[x][y].countNeighbors();
			}
		}	
	}

	SpawnNew();
	if (getAxisRaw("Vertical") != 0) 
	{
		if (getAxisRaw("Vertical") < 0 && speed > 10) speed -= 1; 
		if (getAxisRaw("Vertical") > 0 && speed < 50) speed += 1;
	}
	if (getButtonDown("Restart")) startup();
}

void SpawnNew() 
{
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{
			int neighbors = cells[x][y].numberOfNeighbors;
			if (cells[x][y].alive) 
			{
				if (neighbors < 2  || neighbors > 3) cells[x][y].alive = false;
			}
			if (!cells[x][y].alive && neighbors == 3) cells[x][y].alive = true;
		}
	}
}

void startup() 
{
	cells = new GameObject[numberOfColums][numberOfRows];
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{
			cells[x][y] = new GameObject(x * cellSize, y * cellSize, cellSize, x, y);
			if (random(0, 100) < fillPercentage) cells[x][y].alive = true;
		}
	}
}