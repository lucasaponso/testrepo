#include <iostream>
using namespace std;



int main() {
  int choice;
  cout << "Choose a number between (0-9)??";
  cin >> choice;
  int balance = 0;
  
  
  
  switch (choice) {
  case 1:
    //Check Balance
    cout << balance;
    break;
  
  case 2:
    //Deposit Cash
    int deposit;
    cout << "How much money would you like to deposit??";
    cin >> deposit;
    balance = balance + deposit;
    cout << balance;
    
    
    break;
  case 3:
    int withdraw;
    cout << "How much money would you like to withdraw??";
    cin >> withdraw;
    balance = balance - withdraw;
    cout << balance;
    break;
  case 4:
    
    break;
  case 5:
    
    break;
  case 6:
    
    break;
  case 7:
    
    break;
  }
  return 0;
}
