#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define N 0xffffffff

int main(){
  int count = 0;
  char *prime = malloc(N);

  for (unsigned int i = 2; i <= N; i++) {
    prime[i] = true;
  }

  for (unsigned int p = 2; p*p <= N; p++) {
    if (prime[p] == true) {
      for (unsigned int i = p*2; i <= N; i += p) {
        prime[i] = false;
      }
    }
  }

  for (unsigned int p = 2; p <= N; p++) {
    if (prime[p]) {
        count++;
    }
  }
  printf("%d",count);

  free(prime);

  return 0;
}
