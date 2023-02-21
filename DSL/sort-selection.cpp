#include <iostream>
using namespace std;

void printArray(int arr[],int len){
    for(int i=0;i<len;i++) {
        cout << arr[i] << " ";
    }
    cout << "\n";
}

void selectionSort(int arr[],int len){
    int tmpIdx,temp;
    for ( int i = 0; i < len-1; i++ ){
        tmpIdx = i;
        for ( int j = i+1; j < len; j++ )
            if (arr[j]<arr[tmpIdx])
                tmpIdx = j;
        if (tmpIdx!=i){
            temp = arr[tmpIdx];
            arr[tmpIdx] = arr[i];
            arr[i] = temp;
        }
    }
}
int main()
{
    cout << "Selection Sort" << endl;
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
    selectionSort(arr,len);
    cout << "Sorted Array: ";
    printArray(arr,len);
    return 0;
}