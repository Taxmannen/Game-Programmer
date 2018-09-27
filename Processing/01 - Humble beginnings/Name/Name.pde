color c;
float rgb;
boolean subtract;

void setup() 
{
	size(450, 220);
  	strokeWeight(5);
}

void draw() 
{
  	background(255);
  	stroke(c);

    //D
    rect(30, 50, 75, 100, 7);

    //A
    line(150, 50, 130, 150);
    line(150, 50, 180, 150);
    line(140, 100, 167.5, 100);

    //N
    line(200, 50, 200, 150);
    line(200, 50, 230, 150);
    line(230, 50, 230, 150);

    //I
    line(250, 50, 250, 150);

    //E
    line(280, 50, 280, 150);
    line(280, 50, 340, 50);
    line(280, 100, 320, 100);
    line(280, 150, 340, 150);

    //L
    line(360, 50, 360, 150);
    line(360, 150, 425, 150);

    colorAnimation();
}

void colorAnimation() 
{   
    println(rgb);
    if (rgb == 255) subtract = true;
    if (rgb == 0) subtract = false;
    if (subtract) rgb -= 5;
    else          rgb += 5;
    c = color(rgb);
}