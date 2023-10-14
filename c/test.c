 #include <stdio.h>
 #include <STRING.H>
 #include <stdint.h>

// 123
void printInt(int num){
    char str[16];
    str[15] = 0;
    int i = 14;
    while(num > 0){
        str[i] = (num % 10) + '0';
        num = num / 10;
        i--;
    }
    for(i; i < 16; i++) putchar(str[i]);
    return;
 }

 int main(){
	printInt(123);
 }