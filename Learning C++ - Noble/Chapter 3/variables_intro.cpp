#include <iostream>

using namespace std;

int main() {
	cout << "Program to multiply 2 numbers" << endl;

	int firstNumber = 0;
	cin >> firstNumber;

	cout << "Enter second number";
	int secondNumber = 0;
	cin >> secondNumber;

	int multipResult = firstNumber * secondNumber;

	cout << multipResult << endl;

	return 0;
}