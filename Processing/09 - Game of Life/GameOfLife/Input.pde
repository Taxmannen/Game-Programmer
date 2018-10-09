boolean moveUp;
boolean moveDown;
boolean restart;
boolean restartUp;

void keyPressed() 
{
	if (key == CODED) 
	{
		if 		(keyCode == UP)   moveUp = true;
		else if (keyCode == DOWN) moveDown = true;
	}
	else 
	{
		if 		(key == 'w') moveUp = true;
		else if (key == 's') moveDown = true;
		else if (key == 'r') restart = true;
	}
}

void keyReleased() 
{
	if (key == CODED) 
	{
		if 		(keyCode == UP)   moveUp = false;
		else if (keyCode == DOWN) moveDown = false;
	}
	else 
	{
		if 		(key == 'w') moveUp = false;
		else if (key == 's') moveDown = false;
		else if (key == 'r') 
		{ 
			restart = false; 
			restartUp = true; 
		}
	}
}

float getAxisRaw(String axis) 
{
	if (axis == "Vertical") 
	{
		if (moveUp && moveDown) return 0;
		if (moveUp)   return -1;
		if (moveDown) return 1;
	}
	return 0;
}

boolean getButtonDown(String button) 
{
	if (button == "Restart" && restart && restartUp) 
	{ 
		restartUp = false;
		return true; 
	}
	return false;
}
