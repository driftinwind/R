#include <R.h>
#include <stdio.h>

void twoloop(int *startOne, int *stopOne, int *stepOne, int *startTwo, int *stopTwo, int *stepTwo)
{
	int i,j;
	for(i = *startOne; i < *stopOne+1; i = i + *stepOne)
	for(j = *startTwo; j < *stopTwo+1; j = j + *stepTwo)
	Rprintf("Parameter one is %d and Parameter two is %d\n", i, j);
}
