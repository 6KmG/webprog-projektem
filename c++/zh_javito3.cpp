#include <stdio.h>
#include <stdlib.h>
#include <string>
using namespace std;

class zh_javito3{
private:
    FILE *file;
    int i = 0;
    int j;
    struct adat
    {
        char vez_nev[20];
        char ker_nev[20];
        float fizetes;
    };
    void printint(int n){
        if (n/10){
            printint(n/10);
        }
        putchar(n%10 + 48);
    }

public:
    adat adat[256];

    zh_javito3(const char* file_name) {
        file = fopen(file_name, "w");
    }

    ~zh_javito3(){
        if (fclose(file) == 0){
            puts("Bezarva");
        }
    }

    void betoltes(){
        while(true){
            puts("(Kilepes a 0 karakterrel) Kerem a vezeteknevet: ");   scanf("%s",adat[i].vez_nev);
            if(adat[i].vez_nev[0] == '0'){
                break;
            }
            puts("Kerem a keresztnevet: ");                             scanf("%s",adat[i].ker_nev);
            puts("Kerem a fizetest: ");                                 scanf("%f",&adat[i].fizetes);
            i++;
        }
        sprintf(adat[i].vez_nev, "%d",i);
        float temp = 0;
        j = i;
        while (j<0){
            temp += adat[j].fizetes;
            j--;
        }
        sprintf(adat[i].ker_nev, "%20f",temp);
        adat[j].fizetes = temp/((float)i);
        adat[i+1].vez_nev[0] = '0';
    }
    
    void kiiras(){
        j = 0;
        while (adat[j].vez_nev[0] != '0'){
            printf("%20s %20s %20f\n",adat[j].vez_nev,adat[j].ker_nev,adat[j].fizetes);
            j++;
        }
    }
};

int main(){
    zh_javito3 asd("test.txt");
    asd.betoltes();
    asd.kiiras();
    return 0;
}