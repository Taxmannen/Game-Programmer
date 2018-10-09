GameObject cells[][];
float cellSize = 10;
int numberOfColums;
int numberOfRows;
int fillPercentage = 100;

void setup() 
{	
	frameRate(60);
	size(512, 512);
	ellipseMode(LEFT);

	numberOfColums = (int)Math.floor(width/cellSize);
	numberOfRows   = (int)Math.floor(height/cellSize);

	cells = new GameObject[numberOfColums][numberOfRows];
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{
			cells[x][y] = new GameObject(x * cellSize, y * cellSize, cellSize);
			if (random(0, 100) < fillPercentage) cells[x][y].alive = true;
		}
	}
	neighborCheck();
	println(numberOfColums);
}

void draw() 
{
	background(255);
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{ 
			cells[x][y].draw();
		}
	}
}

void neighborCheck() 
{
	for (int y = 0; y < numberOfRows; y++) 
	{
		for (int x = 0; x < numberOfColums; x++) 
		{
			if (cells[x][y].alive)
			{
				if (x - 1 >= 0 && cells[x-1][y].alive) 			 cells[x][y].numberOfNeighbors++;
				if (y - 1 >= 0 && cells[x][y-1].alive) 			 cells[x][y].numberOfNeighbors++;
				if (x + 1 < cells.length && cells[x+1][y].alive) cells[x][y].numberOfNeighbors++;
				if (y + 1 < cells.length && cells[x][y+1].alive) cells[x][y].numberOfNeighbors++;

				if ((y + 1) < cells.length)
				{
					if (x - 1 >= 0 && cells[x-1][y+1].alive) 		   cells[x][y].numberOfNeighbors++;
					if (x + 1 < cells.length && cells[x+1][y+1].alive) cells[x][y].numberOfNeighbors++;
				}

				if ((y - 1) > 0) 
				{
					if (x - 1 >= 0 && cells[x-1][y-1].alive) 		   cells[x][y].numberOfNeighbors++;
					if (x + 1 < cells.length && cells[x+1][y-1].alive) cells[x][y].numberOfNeighbors++;
				}
			}
		}
	}
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
				if 		(neighbors < 2) 				   println("DÖ(Underpopulation)");
				else if (neighbors == 2 || neighbors == 3) println("Forsätt leva(Next Generation)");
				else if (neighbors > 3) 				   println("DÖ(Overpopulation)");
			}
			if (!cells[x][y].alive && neighbors == 3) println("Ny(Reproduction)");
		}
	}
}