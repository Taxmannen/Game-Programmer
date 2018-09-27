class ParabolicCurve 
{
	public ParabolicCurve(int axis1, int axis2, int numberOfLines) 
	{
		for (int i = 0; i < numberOfLines; i ++) 
  		{
  			if (i % 3 == 0)	stroke(0);
  			else 		    stroke(125);
  			line(0, i * axis2, (i * axis1) + axis1, height);
  		}
	}
}