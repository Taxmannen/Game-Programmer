boolean acorn = false; //Sätt till true ifall du vill spawna "The Acorn"
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
	ellipseMode(CENTER);

	numberOfColums = (int)Math.floor(width/cellSize);
	numberOfRows   = (int)Math.floor((height - 50)/cellSize);

	ui = new Ui();
	startup();
	frame.requestFocus();
}

void startup() 
{
	frameCount = 0;
	cells = new GameObject[numberOfColums][numberOfRows];
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{
			cells[x][y] = new GameObject(x * cellSize, y * cellSize, cellSize, x, y);
			if (random(0, 100) < fillPercentage && !acorn) cells[x][y].alive = true;
		}
	}
	if (acorn) theAcorn();
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
	spawnNewCell();
}

void spawnNewCell() 
{
	if (mousePressed) 
	{
		int x = (int)(mouseX/cellSize);
		int y = (int)(mouseY/cellSize);
		if (x < numberOfRows && y < numberOfColums) 
		{
			if(mouseButton == LEFT) 
			{
				cells[x][y].alive = true;
				cells[x][y].dead  = false;
			}
			else if (mouseButton == RIGHT) 
			{
				cells[x][y].alive = false;
				cells[x][y].dead  = true;
			}
			cells[x][y].alpha = 255;
		}
	}
}