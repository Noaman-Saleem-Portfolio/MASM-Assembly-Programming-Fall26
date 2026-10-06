#include <iostream>
using namespace std;

int main() {
    // Write C++ code here
    int array[4] = {5, 10, 15, 0};

    int temp = array[0] + array[1] + array[2];

    array[3] = temp;

    cout<<temp;
    
    return 0;
}