 #include <stdio.h>
 int main(){
	int a = 15;
	char c;
	char *b = &c;
	while(a>0){
		*b = (char) a % 2 + "0";
		putc(*b);
		b--;
		a = a/2;
	}
	
 }