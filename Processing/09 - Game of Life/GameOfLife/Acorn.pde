void theAcorn()
{
	int x = numberOfColums/2;
	int y = numberOfRows/2;

	cells[x-2][y-1].alive = true;

	cells[x][y].alive = true;

	cells[x-3][y+1].alive = true;
	cells[x-2][y+1].alive = true;
	cells[x+1][y+1].alive = true;
	cells[x+2][y+1].alive = true;
	cells[x+3][y+1].alive = true;
}