#include <iostream>
using namespace std;

// Declare the external assembly function
extern "C" void generate_fibonacci(int, int *);

int main()
{
    int n;
    cout << "Enter the number of Fibonacci numbers to generate: ";
    cin >> n;

    // Create an array to store Fibonacci numbers
    int fib_array[n];

    // Call the assembly function to generate Fibonacci numbers
    generate_fibonacci(n, fib_array);

    // Print the generated Fibonacci numbers
    cout << "First " << n << " Fibonacci numbers: ";
    for (int i = 0; i < n; ++i)
    {
        cout << fib_array[i] << " ";
    }
    cout << endl;

    return 0;
}