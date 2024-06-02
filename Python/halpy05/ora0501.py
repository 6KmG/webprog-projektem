def outer():
    x = "Java" # free variable
    def inner(): # bezárás (closure)
        nonlocal x
        x = "Python"
    inner()
    print(x)

def kulso(x):
    def belso(y):
        return x + y
    return belso

def counter():
    count = 0 # free variable
    def inc1():
        nonlocal count
        count += 1
        return count
    def inc2():
        nonlocal count
        count += 1
        return count
    return inc1, inc2

def counter_func(fn):
    count = 0
    def inner(*args, **kwargs):
        nonlocal count
        count += 1
        print(f"The {fn.__name__} was called {count} times.")
        return fn(*args, **kwargs)
    return inner

@counter_func
def add(a, b=0): return a + b

from time import perf_counter
def timer(fn):
    def inner(*args, **kwargs):
        start = perf_counter()
        result = fn(*args, **kwargs)
        end = perf_counter()
        elapsed = end - start
        print(f"{fn.__name__} {elapsed} mp-ig futott.")
        return result
    return inner

@timer
def fib_recursive(n):
    def fib_inner(n):
        return n if n < 1 else fib_inner(n-1) + fib_inner(n-2)

@timer
def fib_for(n):
    x = 0
    y = 1
    for i in range(2, n+1):
        x, y = y, x+y
    return y

from functools import reduce

@timer
def fib_reduce(n):
    initial_values = (0,1)
    fib_func = lambda fib, _: (fib[1], fib[0]+fib[1])
    fib_number = reduce(fib_func, range(n), initial_values)
    return fib_number[0]

if __name__ == "__main__":
    outer()

    print(kulso(10)(2))

    f1, f2 = counter()
    print(f1(), f2())
    print(f1.__code__.co_freevars)

    add = counter_func(add)
    result = add(6, 5)
    result = add(8, 5)

    print(result)

    n = 40
    print(fib_recursive(n))
    print(fib_for(n))
    print(fib_reduce(n))

#----------------------------------------------------------------------------------------------
# hf1:
# logger decorator fn, mely logolja, hogy mely fn melyik modulbol mikor 
# lett meghívva. 
# Logolt informaciokat irjuk ki egy kulso fajlba
# - inspect modul