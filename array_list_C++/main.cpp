#include <iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

void myFunction() {
  system("pwd");
  
  
}

void myFunction2() {
  system("ls -als");
  }


class MyClass {
  public:             
    int age;       
    int num_of_bitches;  
    int weight;
    bool wet;
};
 

int main() {
  MyClass myObj;
  myObj.age = 10;
  myObj.num_of_bitches = 0;
  myObj.weight = 100;
  myObj.wet = true;
  
  cout << myObj.age;
  cout << myObj.num_of_bitches;
  cout << myObj.weight;
  
  //PRINTING BOOL OF WET   
  if (myObj.wet == true) {
  	cout << "Yes,Wet";
  }
  else if (myObj.wet == false) {
  	cout << "No, Not Wet";
  }

  myFunction();
  myFunction2();
  return 0;
}
