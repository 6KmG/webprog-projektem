from libc.stdio cimport printf
from libc.math cimport sqrt

cpdef primes_to():
    cdef int count = 1,i,j
    cdef char is_prime
    printf("2 ")
    for i in range(3,1000000,2):
        is_prime = True
        for j in range(2,int(sqrt(i))+1):
            if i%j==0:
                is_prime = False
                break
        if is_prime == True:
            printf("%d ",i)
            count += 1
    printf(" %d",count)