#include <iostream>
using namespace std;

// Declaring the external function from assembly
extern "C" void find_second_largest(int[], int, int *);

int main()
{
    int len;
    cout << "Enter the size of the array: ";
    cin >> len;

    int lst[len];
    cout << "Enter " << len << " integers:\n";
    for (int i = 0; i < len; ++i)
    {
        cout << "Enter number " << i+1 << ": ";
        cin >> lst[i];
    }

    int second_largest;
    
    // Call the assembly function
    find_second_largest(lst, len, &second_largest);

    cout << "Second Largest Number: " << second_largest << endl;

    return 0;
}


















