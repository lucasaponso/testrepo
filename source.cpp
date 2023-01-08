#include<iostream>
#include<bits/stdc++.h>
using namespace std;
int main()
{
  string cars[5] = {"10.20.212.50 -c 2 ", "10.20.212.60 -c 2", "10.20.212.61 -c 2", "10.20.212.62 -c 2", "10.20.220.230 -c 2"};
  for (int i = 0; i < 5; i++) {
    string str = "ping ";
    str = str + cars[i];
    const char *command = str.c_str();

    cout << "Compiling file using " << command << endl;
    cout << "Git Change Test"
    system(command);
  }
  return 0;
 }

