void setup() 
{
	size (720, 480);
  	strokeWeight(5);
}

void draw() 
{
  	background(255);
  	stroke(128, 128, 128, 128);

  	for (int i = 0; i < 15; i ++) 
  	{
  		int spacing = 40;
  		if (i % 3 == 0)	stroke(0);
  		else 		    stroke(125);
  		line(0, i * spacing, (i * spacing) + spacing, height);
  	}
}