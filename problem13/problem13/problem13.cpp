// problem13.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <fstream>
#include <string>
using namespace std;


int main(){

    const int decsize = 50;
    char linechars[decsize+1];

    ifstream inFile;
    
    int carry = 1;
    int decimalvals[decsize] = {0};
    int tempval; 

    string line;
    string numberstring[100];
    

    inFile.open("problem13.txt");
    if (!inFile) {
        cout << "Unable to open file";
        exit(1); // terminate with error
    }
    while (getline(inFile,line)){
        strcpy_s(linechars,line.c_str());
        //cout << linechars[50] << (int)linechars[0] -48 << "\n";
        for (int i = 0; i < decsize; i++) {
            decimalvals[i] += (int)linechars[i] - 48;
        }
    }
    inFile.close();

    for (int i = 49; i > 0; i--) {
        decimalvals[i - 1] += decimalvals[i] / 10;
        tempval = (decimalvals[i]) % 10;
        decimalvals[i] = tempval;
    }
    for (int i=0; i < decsize; i++) cout << decimalvals[i];    
    return 0;
}
