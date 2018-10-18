public class GameObject 
{
	boolean alive = false;
	boolean dead = false;
	PVector position;
	PVector index;
	float size;
	int neighbors;
	int alpha = 255;
	int alphaSpeed = 5;

	public GameObject(PVector position, PVector index, float size) 
	{
		this.position = position;
		this.index = index;
		this.size = size;
	}

	void update() 
	{
		aliveCheck();
	}

	void draw() 
	{
		stroke(0);
		if (dead && alpha > (50 + alphaSpeed)) alpha -= alphaSpeed;

		if (alive || dead) 
		{
			if (dead) fill(255, 0, 0, alpha);
			else 	  fill(0, 255, 0, alpha);
		}
		else noFill();
		rect(position.x, position.y, size, size);
	}

	void countNeighbors() 
	{
		neighbors = 0;
		if (alive) 
		{
			int x = (int)index.x;
			int y = (int)index.y;

			if (x - 1 >= 0 && cells[x-1][y].alive)		       neighbors++;
			if (y - 1 >= 0 && cells[x][y-1].alive) 			   neighbors++;
			if (x + 1 < numberOfColums && cells[x+1][y].alive) neighbors++;
			if (y + 1 < numberOfRows && cells[x][y+1].alive)   neighbors++;

			if ((y + 1) < numberOfRows)
			{
				if (x - 1 >= 0 && cells[x-1][y+1].alive) 		     neighbors++;
				if (x + 1 < numberOfColums && cells[x+1][y+1].alive) neighbors++;
			}

			if ((y - 1) > 0) 
			{
				if (x - 1 >= 0 && cells[x-1][y-1].alive) 		     neighbors++;
				if (x + 1 < numberOfColums && cells[x+1][y-1].alive) neighbors++;
			}
		}
	}

	void aliveCheck() 
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