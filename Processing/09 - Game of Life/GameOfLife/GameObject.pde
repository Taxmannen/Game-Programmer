public class GameObject 
{
	boolean alive = false;
	boolean dead = false;
	PVector position;
	PVector index;
	float size;
	int numberOfNeighbors;

	public GameObject(float x, float y, float size, int xIndex, int yIndex) 
	{
		position = new PVector(x, y);
		index = new PVector(xIndex, yIndex);
		this.size = size;
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
		numberOfNeighbors = 0;
		if (alive) 
		{
			int x = (int)index.x;
			int y = (int)index.y;
			if (x - 1 >= 0 && cells[x-1][y].alive)		     numberOfNeighbors++;
			if (y - 1 >= 0 && cells[x][y-1].alive) 			 numberOfNeighbors++;
			if (x + 1 < cells.length && cells[x+1][y].alive) numberOfNeighbors++;
			if (y + 1 < cells.length && cells[x][y+1].alive) numberOfNeighbors++;

			if ((y + 1) < cells.length)
			{
				if (x - 1 >= 0 && cells[x-1][y+1].alive) 		   numberOfNeighbors++;
				if (x + 1 < cells.length && cells[x+1][y+1].alive) numberOfNeighbors++;
			}

			if ((y - 1) > 0) 
			{
				if (x - 1 >= 0 && cells[x-1][y-1].alive) 		   numberOfNeighbors++;
				if (x + 1 < cells.length && cells[x+1][y-1].alive) numberOfNeighbors++;
			}
		}
	}
}