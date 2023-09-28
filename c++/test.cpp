#include <iostream>

int* length(int *array[]){
    int *p = array;
    return p + 1;
}

int main(){
    int a[6];
    printf("%d\n", length(&a));
    printf("%d\n", &a);
    // *(&a + 1) - a
}