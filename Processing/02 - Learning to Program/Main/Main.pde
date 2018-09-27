void setup() 
{
    size (720, 480);
  	strokeWeight(5);
}

void draw() 
{
  	background(255);
    new ParabolicCurve(40, 40, 15);
}