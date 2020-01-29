// problem16.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h>
using namespace std;
int main(){
    const int powv = 1000;
    char *multpres;
    int charv;
    int carryv;
    int numberofdigits = 1;
    int counter = 0;

    int sumval = 0;

    char c;
    
    multpres = (char*) malloc(numberofdigits*sizeof(char));
    *(multpres) = '1';
    for (int i = 0; i < powv; i++){
        carryv = 0;
        counter = 0;
        while (counter < numberofdigits) {
            c = *(multpres+counter);
            charv = int(c - 48);
            charv = charv * 2 + carryv;
            *(multpres+counter) = '0' + charv % 10;
            carryv = charv/10;
            counter += 1;
            if ((counter == numberofdigits) && (carryv != 0)) {
                numberofdigits += 1;
                multpres = (char*) realloc(multpres, numberofdigits * sizeof(char));
                *(multpres + counter) = '0';
            }
        }
    }
    for (int i = numberofdigits - 1; i > -1; i--)
        sumval += int(*(multpres + i)-48);
    cout << sumval;
    
}