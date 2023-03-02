import multiprocessing
import math

def compute(fr,to):
    count = 0
    for i in range(fr,to,2):
        is_prime = True
        square = int(math.sqrt(i))+1
        for j in range(3,square,2):
            if i%j==0:
                is_prime = False
                break
        if is_prime == True:
            count += 1
    return count

if __name__ == '__main__':
    with multiprocessing.Pool(4) as p:
        results=p.starmap(compute,[(3,3_800_000),(3_800_001,6_200_000),(6_200_001,8_200_000),(8_200_001,10_000_000)])

    total_result = sum(results)+1
    print(total_result)