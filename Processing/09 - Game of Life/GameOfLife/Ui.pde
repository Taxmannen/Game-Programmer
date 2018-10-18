class Ui 
{
	int displaySpeed = 25;
	int speed = 25;
	int zoom = 1;

	void update() 
	{
		inputManager();
		draw();
		speed = 100 - (displaySpeed - 2);
	}

	void draw() 
	{
		translate(0, height - 15);
		textSize(16);
		textAlign(CENTER);
	
		fill(0);
		rect(0, -35.5, width, 2);
		
		text("[R] Restart", width/2, -15);
		text("[W] Speed:" + displaySpeed + " [S]", 100, -15);
		text("[A] Spawnrate:" + fillPercentage + " [D]", width - 100, -15);

		text("[C] Clear Board", width/2, 10);
		text("[Left Mouse] Spawn", 100, 10);
		text("[Right Mouse] Kill", width - 100, 10);
	}
}