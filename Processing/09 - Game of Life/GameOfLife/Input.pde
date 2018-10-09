boolean moveUp;
boolean moveDown;
boolean restart;

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
		else if (key == 'r') restart = false;
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
	
	else if (axis == "Restart")
	{
		if (restart) return 1;
		else return 0;
	}
	return 0;
}

boolean getButtonDown(String button) 
{
	if (button == "Restart" && restart) return true; 
	return false;
}
