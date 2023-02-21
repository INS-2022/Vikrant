#include <iostream>
using namespace std;

void printArray(int arr[],int len){
    for(int i=0;i<len;i++) {
        cout << arr[i] << " ";
    }
    cout << "\n";
}

void bubbleSort(int arr[], int len) {
    bool sorted = false;
    int temp;
    while (!sorted)
    {
        sorted = true;
        for (int j = 0; j < len-1; j++)
        {
            if (arr[j]>arr[j+1]){
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                sorted=false;
            }
        }
    }
}

int main()
{
    cout << "Bubble Sort" << endl;
    int len;
    cout << "Enter the number of elements : " ;
    cin >> len ;
    int arr[len];
    cout << "Enter the elements separated with spaces : " ;
    for(int i=0;i<len;i++) {
        cin >> arr[i];
    }
    cout << "Unsorted Array: ";
    printArray(arr, len);
    bubbleSort(arr,len);
    cout << "Sorted Array: ";
    printArray(arr,len);
    return 0;
}