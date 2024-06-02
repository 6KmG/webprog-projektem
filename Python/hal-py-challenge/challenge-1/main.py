# Challenge 1:
# Írjunk egy logger dekorátor függvényt, ami logolja, hogy mely függvény,
# melyik modulból, mikor lett meghívva. A logolt információkat írjuk ki
# egy külső log fájlba.
# Kommenteljük a programunkat!
print(end="\n\n")

from logger import log
import example  # Ebben a fájlban is készült egy kis program, hogy ezt is logolja.

# Szándékosan csináltam meg a b-t paraméternek és később nem adtam meg mikor lefuttattam, hogy hibát jelezzen.
@log('d')
def foo(a, b): 
    print(a)

foo(5)
