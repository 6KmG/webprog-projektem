#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    FILE *file = fopen("english_nouns.txt","r");
    srand(time(0));

    char a = 0;
    short j = 0;
    short i = 0;
    short k = 0;
    char list[1500][20];
    char buffer[0xffff];

    while(feof(file)==0)
    {
        a = fgetc(file);
        buffer[i] = a;
        i++;
    }
    buffer[i] = 0;
    j = 0;
    k = 0;
    for (i = 0; i < 1500; i++)
    {
        while(buffer[k]!=10){
            list[i][j] = buffer[k];
            k++;
            j++;
        }
        list[i][j] = 0;
        j = 0;
        k++;
    }
    
    printf("%s%s",list[rand()%1500],list[rand()%1500]);

    fclose(file);
    return 0;
}