// problem14.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
#include <iostream>
#include <stdlib.h>
using namespace std;

int main(){
	const int arraysize = 1000000;
	int *thecnts = new int[arraysize];
	int positioner;
	long long int selval;
	int maxfnd;
	int counter;
	int flag = 0;
	
	int maxcnt = 0;
	int maxcntval;

	for (int i = 2; i < arraysize; i++)
		thecnts[i] = 0;

	thecnts[0] = 0;
	thecnts[1] = 1;
 	for (positioner = 3; positioner < arraysize; positioner++) {
		selval = positioner;
		counter = 0;
		while (selval != 1) {
			if (selval % 2 == 0) {
				selval = selval / 2;
				counter += 1;
				if (selval < positioner) {
					flag = 1;
					break;
				}
			}
			else {
				selval = selval * 3 + 1;
				counter += 1;
			}
		}
		if (flag == 1) thecnts[positioner - 1] = thecnts[selval - 1] + counter;
		else thecnts[positioner - 1] = counter;
		printf("value: %i, counter: %i \n", positioner, thecnts[positioner-1]);
		if (thecnts[positioner - 1] > maxcnt) {
			maxcnt = thecnts[positioner - 1];
			maxcntval = positioner;
		}
		
	}
	printf("value: %i, counter: %i \n", maxcntval, maxcnt);
	return 0;
}