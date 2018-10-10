public class GameObject 
{
	boolean alive = false;
	boolean dead = false;
	PVector position;
	PVector index;
	float size;
	int neighbors;

	public GameObject(float x, float y, float size, int xIndex, int yIndex) 
	{
		position = new PVector(x, y);
		index = new PVector(xIndex, yIndex);
		this.size = size;
	}

	void update() 
	{
		spawnNew();
	}

	void draw() 
	{
		if (alive || dead) 
		{
			if (!dead) fill(0);
			else fill(0, 50);
			stroke(255);
			rect(position.x, position.y, size, size);
		}
	}

	void countNeighbors() 
	{
		neighbors = 0;
		if (alive) 
		{
			//COLUMS VÄNSTER OCH HÖGER
			//ROWS UPP O NER
			println("Cells Length " + cells.length + " Rows " + numberOfRows + " Colums " + numberOfColums);
			int x = (int)index.x;
			int y = (int)index.y;
			if (x - 1 >= 0 && cells[x-1][y].alive)		     neighbors++;
			if (y - 1 >= 0 && cells[x][y-1].alive) 			 neighbors++;
			if (x + 1 < numberOfColums && cells[x+1][y].alive) neighbors++;
			if (y + 1 < numberOfRows && cells[x][y+1].alive) neighbors++;

			if ((y + 1) < numberOfRows)
			{
				if (x - 1 >= 0 && cells[x-1][y+1].alive) 		   neighbors++;
				if (x + 1 < numberOfColums && cells[x+1][y+1].alive) neighbors++;
			}

			if ((y - 1) > 0) 
			{
				if (x - 1 >= 0 && cells[x-1][y-1].alive) 		   neighbors++;
				if (x + 1 < numberOfColums && cells[x+1][y-1].alive) neighbors++;
			}
		}
	}

	void spawnNew() 
	{
		if (alive) 
		{
			if (neighbors < 2  || neighbors > 3)
			{ 
				alive = false;
				dead = true; 
			}
		}
		if (!alive && neighbors == 3) alive = true;
	}
}