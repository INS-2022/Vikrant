#include<iostream>
using namespaces std;

int search (int arr[], int len, int x){
    for (int i=0; i<len; i++) {
        if (arr[i] == x) {
            return i;
        }
    }
    return -1;
}

int main() {
    int n;
    cout << "Enter the length of the array : " ;
    cin >> n;
    int arr[n];
    cout << "Enter the elements of the array : " ;
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }
    int x;
    cout << "Enter the element to be searched : " ;
    cin >> x;
    int index = search(arr, n, x);
    if (index!= -1) {
        cout << "Element found at index " << index << endl;
        return 0;
    } 
    cout << "No element found at index " << index << endl;
}