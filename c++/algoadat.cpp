#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

const int N = 15;
int numbers[N];

void generateNumbers(bool twoHalf)
{
    srand(time(NULL));
	
	for(int i = 0; i < N; i++)
	{
	    if(twoHalf)
	    {
	        int mid = (N - 1) / 2 + 1;
	        if(i == 0 || i == mid)
	        {
	            numbers[i] = rand() % 12 + 1;
	        }
	        else
	        {
	            numbers[i] = numbers[i - 1] + rand() % 12 + 1;
	        }
	    }
	    else
	    {
		    numbers[i] = rand() % 99 + 1;
	    }
	}
}
void printNumbers()
{
    for(int i = 0; i < N; i++)
	{
		cout << numbers[i] << " ";
	}
	cout << endl;
}

void mergeSort(int bottom, int top){
	int tmp[N];
	int bottomi = bottom;
	int topi = top / 2;
	const int BOTTOMLIMIT = top / 2;
	int i = 0;
	while(true){
		if(numbers[bottomi] < numbers[topi]){
			tmp[i] = numbers[bottomi];
			bottomi++;
			i++;
		}
		else{
			tmp[i] = numbers[topi];
			topi++;
			i++;
		}
		if(bottomi <= BOTTOMLIMIT && topi > top){
			tmp[i] = numbers[bottomi];
			bottomi++;
			i++;
		}
		if(i > top) break;
	}
	for(i = 0; i < N; i++){
		cout<<tmp[i]<<" ";
	}
	cout<<endl;
}

int main() 
{
	generateNumbers(false);
	printNumbers();
     
	//Összefésülő rendezés
	mergeSort(0, N);
	
	printNumbers();
}