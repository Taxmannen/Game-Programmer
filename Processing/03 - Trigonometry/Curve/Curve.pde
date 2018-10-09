float angle;
float x;
float y;

void setup()
{
	size(720, 480);
  	strokeWeight(5);
}

void draw() 
{
	background(255);
	drawCurve(true);
	drawCurve(false);
}

void drawCurve(boolean sin) 
{
	if (sin) stroke(0);
	else 	 stroke(125);
	for (int i = 0; i < 100; i++) 
	{
  		x = 100 + (i * 5);
  		if (sin) y = height/2 + sin(angle) * 60.0;
  		else  	 y = height/2 + cos(angle) * 60.0;
  		
  		point(x, y);
  		angle = angle + TWO_PI/50;
	}
}