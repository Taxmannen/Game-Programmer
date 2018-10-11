GameObject cells[][];
float cellSize = 10;
int numberOfColums;
int numberOfRows;
int fillPercentage = 25;
int fps = 30;
Ui ui;

void setup() 
{	
	frameRate(fps);
	size(512, 562);
	ellipseMode(LEFT);

	numberOfColums = (int)Math.floor(width/cellSize);
	numberOfRows   = (int)Math.floor((height - 50)/cellSize);

	ui = new Ui();
	startup();
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
	frameCount = 0;
}

void draw() 
{
	background(255);
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{ 
			cells[x][y].draw();
			cells[x][y].countNeighbors();
			if (frameCount % - ui.speed == 1 && frameCount > 10)
			{
				cells[x][y].update();
			} 
		}
	}	
	ui.update();
}