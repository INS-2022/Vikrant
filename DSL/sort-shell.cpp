#include <iostream>
using namespace std;

void printArray(int arr[],int len){
    for(int i=0;i<len;i++) {
        cout << arr[i] << " ";
    }
    cout << "\n";
}

void shellSort(int arr[], int len) {
    for(int gap = len/2; gap>0; gap/=2) {
        for (int i = gap; i < len; i++){
            int temp = arr[i];
            int j;
            for ( j=i; j>=gap && arr[j-gap] > temp ;j-=gap){
                arr[j] = arr[j-gap];
            }
            arr[j] = temp;
        }
    }
}

int main()
{
    cout << "Shell Sort" << endl;
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
    shellSort(arr,len);
    cout << "Sorted Array: ";
    printArray(arr,len);
    return 0;
}