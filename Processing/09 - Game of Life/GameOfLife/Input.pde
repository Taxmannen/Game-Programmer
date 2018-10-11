boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean restart;
boolean restartUp = true;
boolean exit;
boolean exitUp = true;

void keyPressed() 
{
	if (key == CODED) 
	{
		if 		(keyCode == UP)    moveUp = true;
		else if (keyCode == DOWN)  moveDown = true;
		else if (keyCode == LEFT)  moveLeft = true;
		else if (keyCode == RIGHT) moveRight = true;
		else if (keyCode == ESC)   exit = true;
	}
	else 
	{
		if 		(key == 'w') moveUp = true;
		else if (key == 's') moveDown = true;
		else if (key == 'a') moveLeft = true;
		else if (key == 'd') moveRight = true;
		else if (key == 'r') restart = true;

	}
}

void keyReleased() 
{
	if (key == CODED) 
	{
		if 		(keyCode == UP)    moveUp = false;
		else if (keyCode == DOWN)  moveDown = false;
		else if (keyCode == LEFT)  moveLeft = false;
		else if (keyCode == RIGHT) moveRight = false;
		else if (keyCode == ESC)   exit = false;
	}
	else 
	{
		if 		(key == 'w') moveUp = false;
		else if (key == 's') moveDown = false;
		else if (key == 'a') moveLeft = false;
		else if (key == 'd') moveRight = false;
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
	if (axis == "Horizontal") 
	{
		if (moveLeft && moveRight) return 0;
		if (moveLeft)  return -1;
		if (moveRight) return 1;
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
	else if (button == "Exit" && exit && exitUp) 
	{
		exitUp = false;
		return true;
	}
	return false;
}