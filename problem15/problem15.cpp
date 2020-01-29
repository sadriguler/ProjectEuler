// problem15.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h> 
using namespace std;

int main(){
    const int arrsize = 21;
    unsigned long long int grid[arrsize][arrsize];

    grid[0][0] = 1; 
    for (int i = 1; i < arrsize; i++) {
        grid[i][0] = 1;
        printf("%lld ", grid[i][0]);
        for (int j = 1; j < i; j++){
            grid[i][j] = grid[i][j - 1] + grid[i - 1][j];
            printf("%lld ", grid[i][j]);
        }
        grid[i][i] = 2 * grid[i][i - 1];
        printf("%lld\n", grid[i][i]);

    }
    
    printf("%lld\n", grid[arrsize-1][arrsize - 1]);
}