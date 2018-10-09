public class GameObject 
{
	boolean alive = false;
	PVector position;
	float size;
	int numberOfNeighbors;

	public GameObject(float x, float y, float size) 
	{
		position = new PVector(x, y);
		this.size = size;
	}

	void draw() 
	{
		if (alive) ellipse(position.x, position.y, size, size);
	}
}