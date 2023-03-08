import math

def congruenceModulo(multiplier, modulo, remainder):
    # Congruence modulo
    
    print(f"%dx ≅ %d \t (mod %d)"% (multiplier, remainder, modulo))
    
    greatestDivisor = math.gcd(modulo, multiplier)
    print(f"(%d, %d) = %d" % (multiplier, modulo, greatestDivisor))
    
    if(int(remainder / greatestDivisor) != remainder / greatestDivisor):
        print("There's no result!")
        return 0
    
    multiplier1 = int(multiplier / greatestDivisor)
    modulo1 = int(modulo / greatestDivisor)
    remainder1 = int(remainder / greatestDivisor)
    print(f"%dx ≅ %d \t (mod %d)"% (multiplier1, remainder1, modulo1))
    
    for i in range(0,1000,modulo):
        if remainder1 % multiplier1 == 0:
            remainder1 = remainder1 / multiplier1
            multiplier1 = multiplier1 / multiplier1
            break
        remainder1 += modulo1
    
    x = int(remainder1)
    while x // modulo1 != 0:
        x -= modulo1
    
    print(f"x = %d + %dk \t k ∈ ℤ\n"%(x, modulo1))
    
    return x

# multiplier = 10
# modulo = 35
# remainder = 25
# congruenceModulo(multiplier, modulo, remainder)


def ChineseRemainder2(r1, r2, mod1, mod2, mul1 = 1, mul2 = 1):
    r1 = congruenceModulo(mul1, mod1, r1)
    r2 = congruenceModulo(mul2, mod2, r2)
    
    M = mod1 * mod2
    M1 = mod2
    M2 = mod1
    
    print(f"\nM = {mod1} * {mod2} = {M}")
    print(f"M1 = {mod2} = {M1}")
    print(f"M2 = {mod1} = {M2}")
    
    y1 = congruenceModulo(M1, mod1, r1)
    y2 = congruenceModulo(M2, mod2, r2)
    
    R = M1 * y1 + M2 * y2
    
    res = congruenceModulo(1, M, R)



def ChineseRemainder3(r1, r2, r3, mod1, mod2, mod3, mul1 = 1, mul2 = 1, mul3 = 1):
    r1 = congruenceModulo(mul1, mod1, r1)
    r2 = congruenceModulo(mul2, mod2, r2)
    r3 = congruenceModulo(mul3, mod3, r3)
    
    M = mod1 * mod2 * mod3
    M1 = mod2 * mod3
    M2 = mod1 * mod3
    M3 = mod1 * mod2
    
    print(f"\nM = {mod1} * {mod2} * {mod3} = {M}")
    print(f"M1 = {mod2} * {mod3} = {M1}")
    print(f"M2 = {mod1} * {mod3} = {M2}")
    print(f"M3 = {mod1} * {mod2} = {M3}\n")
    
    y1 = congruenceModulo(M1, mod1, r1)
    y2 = congruenceModulo(M2, mod2, r2)
    y3 = congruenceModulo(M3, mod3, r3)
    
    R = M1 * y1 + M2 * y2 + M3 * y3
    
    res = congruenceModulo(1, M, R)
    
    
def ChineseRemainder4(r1, r2, r3, r4, mod1, mod2, mod3, mod4, mul1 = 1, mul2 = 1, mul3 = 1, mul4 = 1):
    r1 = congruenceModulo(mul1, mod1, r1)
    r2 = congruenceModulo(mul2, mod2, r2)
    r3 = congruenceModulo(mul3, mod3, r3)
    r4 = congruenceModulo(mul4, mod4, r4)
    
    M = mod1 * mod2 * mod3  * mod4
    M1 = mod2 * mod3  * mod4
    M2 = mod1 * mod3  * mod4
    M3 = mod1 * mod2  * mod4
    M4 = mod1 * mod2 * mod3
    
    print(f"\nM = {mod1} * {mod2} * {mod3} * {mod4} = {M}")
    print(f"M1 = {mod2} * {mod3} * {mod4} = {M1}")
    print(f"M2 = {mod1} * {mod3} * {mod4} = {M2}")
    print(f"M3 = {mod1} * {mod2} * {mod4} = {M3}")
    print(f"M4 = {mod1} * {mod2} * {mod3} = {M4}\n")
    
    y1 = congruenceModulo(M1, mod1, r1)
    y2 = congruenceModulo(M2, mod2, r2)
    y3 = congruenceModulo(M3, mod3, r3)
    y4 = congruenceModulo(M4, mod4, r4)
    
    R = M1 * y1 + M2 * y2 + M3 * y3 + M4 * y4
    
    res = congruenceModulo(1, M, R)
    
r1 = 3
r2 = 2
r3 = 2
r4 = 3
mod1 = 4
mod2 = 3
mod3 = 5
mod4 = 7

# ChineseRemainder2(3, 6, 5, 7, 4, 5)
# ChineseRemainder3(2, 3, 6, 3, 5, 7)
# ChineseRemainder4(r1, r2, r3, r4, mod1, mod2, mod3, mod4)

def diophantineEquation():
    xn = 8
    yn = 6
    res = 16
    
    if(yn >= 0):
        print(f"{xn}x + {yn}y = {res}")
    else:
        print(f"{xn}x - {-yn}y = {res}")
    
    greatestDivisor = math.gcd(xn, yn)
    
    if(int(res / greatestDivisor) != res / greatestDivisor):
        print("No solution")
        return 0
    
    xn1 = int(xn / greatestDivisor)
    yn1 = int(yn / greatestDivisor)
    res1 = int(res / greatestDivisor)
    
    if(yn1 >= 0):
        print(f"{xn1}x + {yn1}y = {res1}")
    else:
        print(f"{xn1}x - {-yn1}y = {res1}")



def euclideanAlgorithm(x: int, y: int):
    x1 = x
    y1 = y
    r = x1 % y1
    print(f"{x1} = {x1 // y1} * {y1} + {r}")
    
    while r > 0:
        x1 = y1
        y1 = r
        r = x1 % y1
        print(f"{x1} = {x1 // y1} * {y1} + {r}")
        
    return y1



def leastCommonMultiple(x: int, y: int):
    return int(x * y / euclideanAlgorithm(x, y))

euclideanAlgorithm(377, 85)

def isDivisible():
    mod = 6
    n = 1
    equation = n**3+11*n

    if equation % 6 != 0:
        print("no solution")
        return 0
    
    k = None
    n = k
    equation = k**3 + 11*k
