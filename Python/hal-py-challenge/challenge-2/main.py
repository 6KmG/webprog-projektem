# Generátorral
def prime_generator():
    yield 2
    current = 3
    while True:
        if is_prime(current):
            yield current
        current += 2

def is_prime(n):
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

# Iterátorral
class PrimeIterator:
    def __init__(self):
        self.current = 2

    def __iter__(self):
        return self

    def __next__(self):
        while True:
            if self.is_prime(self.current):
                prime = self.current
                self.current += 1
                return prime
            self.current += 1

    def is_prime(self, n):
        if n <= 1:
            return False
        if n <= 3:
            return True
        if n % 2 == 0 or n % 3 == 0:
            return False
        i = 5
        while i * i <= n:
            if n % i == 0 or n % (i + 2) == 0:
                return False
            i += 6
        return True

# Itt fut le
if __name__ == "__main__":
    prime_gen = prime_generator()
    for _ in range(20):
        print(next(prime_gen), end=", ")
    print()

    prime_iterator = PrimeIterator()
    for _ in range(10):
        print(next(prime_iterator), end=", ")
