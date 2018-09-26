int spawnCount = 1;
ArrayList<Creature> humans;
ArrayList<Creature> zombies;
boolean gameOver = false;
float time;

void setup()
{
	humans = new ArrayList<Creature>();
	zombies = new ArrayList<Creature>();
	size(512, 512);

	for (int i = 0; i < 99; i++) humans.add(new Human());
	for (int i = 0; i < 1; i++) zombies.add(new Zombie());
}

void draw()
{
	background(255);
	for (int i = 0; i < humans.size(); i++) 
	{
		humans.get(i).update();
		for (int j = 0; j < zombies.size(); j++) 
		{
			if (humans.size() > i && zombies.size() > j) 
			{
				Creature human = humans.get(i);
				Creature zombie = zombies.get(j);
				boolean hasCollided = collision(human.position.x, human.position.y, human.size/2, zombie.position.x, zombie.position.y, zombie.size/2);
				if (hasCollided) 
				{
					zombies.add(new Zombie(humans.get(i).position.x, humans.get(i).position.y));
					humans.remove(i);
				}
			}
		}
	}

	for (int i = 0; i < humans.size(); i++) humans.get(i).draw();
	for (int i = 0; i < zombies.size(); i++) 
	{
		zombies.get(i).update();
		zombies.get(i).draw();
	}
	if (zombies.size() == humans.size() + zombies.size()) gameOver();
}

boolean collision(float x1, float y1, int size1, float x2, float y2, int size2) 
{
	int maxDistance = size1 + size2;
	if (abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance) return false;
	else if (dist(x1, y1, x2, y2) > maxDistance) 			      return false;
	else return true;
}

void gameOver() 
{
	if (!gameOver) time = millis() / 1000;
	fill(0);
	textSize(30);
	textAlign(CENTER);
	text("Game Over(" + time + " seconds)", width/2, height/2);
	gameOver = true;
}