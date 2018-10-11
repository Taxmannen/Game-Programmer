boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean zoomIn;
boolean zoomOut;

boolean restartDown;
boolean restartUp = true;
boolean clearDown;
boolean clearUp = true;

void keyPressed() 
{
	if (key == CODED) 
	{
		if 		(keyCode == UP)    moveUp = true;
		else if (keyCode == DOWN)  moveDown = true;
		else if (keyCode == LEFT)  moveLeft = true;
		else if (keyCode == RIGHT) moveRight = true;
	}
	else 
	{
		if 		(key == 'w') moveUp = true;
		else if (key == 's') moveDown = true;
		else if (key == 'a') moveLeft = true;
		else if (key == 'd') moveRight = true;
		else if (key == 'q') zoomOut = true;
		else if (key == 'e') zoomIn = true;

		else if (key == 'r') restartDown = true;
		else if (key == 'c') clearDown = true;
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
	}
	else 
	{
		if 		(key == 'w') moveUp = false;
		else if (key == 's') moveDown = false;
		else if (key == 'a') moveLeft = false;
		else if (key == 'd') moveRight = false;
		else if (key == 'q') zoomOut = false;
		else if (key == 'e') zoomIn = false;

		else if (key == 'r') 
		{ 
			restartDown = false; 
			restartUp   = true; 
		}
		else if (key == 'c') 
		{
			clearDown = false;
			clearUp   = true;
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
	else if (axis == "Horizontal") 
	{
		if (moveLeft && moveRight) return 0;
		if (moveLeft)  return -1;
		if (moveRight) return 1;
	}
	else if (axis == "Zoom") 
	{
		if (zoomIn && zoomOut) return 0;
		if (zoomOut) return -1;
		if (zoomIn)  return 1;
	}
	return 0;
}

boolean getButtonDown(String button) 
{
	if (button == "Restart" && restartDown && restartUp) 
	{ 
		restartUp = false;
		return true; 
	}
	else if (button == "Clear" && clearDown && clearUp) 
	{
		clearUp = false;
		return true;
	}
	return false;
}