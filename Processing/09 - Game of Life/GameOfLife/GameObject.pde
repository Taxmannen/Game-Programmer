public class GameObject 
{
	boolean alive = false;
	PVector position;
	float size;
	int numberOfNeighbors;
	int x, y;

	public GameObject(float x, float y, float size, int xIndex, int yIndex) 
	{
		position = new PVector(x, y);
		this.size = size;
		this.x = xIndex;
		this.y = yIndex;
	}

	void draw() 
	{
		if (alive) ellipse(position.x, position.y, size, size);
	}

	void countNeighbors() 
	{
		numberOfNeighbors = 0;
		if (alive) 
		{
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
		println(numberOfNeighbors);
	}
}