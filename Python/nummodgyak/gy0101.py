import math

a = -1024.5

def fl(a: float) -> str:
    result = ""
    sign = ""

    if a < 0:
        sign = "-"
        a = a*-1

    p = a%1
    a = int(a - p)

    while a >= 1:           # Egészrész
        result += str(a%2)
        a = int(a / 2)

    result += sign          # a szöveg végére rakja az előjelet
    result = result[::-1]   # megfordítja a szöveget így az előjel az elejére kerül

    if p > 0:               # Törtrész 
        result+="."
        for i in range(64):
            if p == 0: break
            
            result += str(math.floor(p*2))
            p = (p*2)%1
    return result

def mantissza(t=5, kminusz=-5, kplussz=5):
    def __fl(a):
        binary = fl(a)
        sign = '+'

        if sign == '+':
            if int(a) > 2**kplussz:
                return "NaN"
        if sign == '-':
            if int(a) < 2**kminusz:
                return "NaN"

        if binary[0] == '-':
            sign = '-'
            binary = binary[1:]

        exponent = 0
        for i in range(len(binary)):
            exponent = i
            if binary[i] == '.':
                binary = binary[:i] + binary[i+1:]
                exponent -= 1
                break
        exponent += 1

        binary = sign+'['+binary[:t]+'|'+str(exponent)+']'
        return binary

    return __fl


def flForditas(a: str) -> float:        # visszafordítja a szövegtípusú bináris számot lebegőpontos számmá
    result = 0.0
    integralPart = ""
    fractionalPart = ""
    point = len(a)

    for i in range(len(a)):
        if a[i] == '.':
            point = i
            break

    integralPart = a[:point]
    fractionalPart = a[point+1:]
    exponent = 1
    
    for i in range(len(integralPart)-1,0,-1):       # egészrész
        result += float(integralPart[i]) * exponent
        exponent *= 2

    exponent = 1/2
    for i in range(len(fractionalPart)):            # törtrész
        result += float(fractionalPart[i]) * exponent
        exponent /= 2

    return result
    
def mantisszaForditas(mantissa: str) -> str:   # visszafordítja a mantissza számot szöveg típusú bináris számmá
    fraction = ""
    sign = mantissa[0]
    exponent = ""
    writeExponent = False
    for i in range(2, len(mantissa)):
        if mantissa[i] == '|':
            writeExponent = True
        if mantissa[i] == ']':
            break
        
        if not writeExponent:
            fraction += mantissa[i]

        if writeExponent: 
            exponent += mantissa[i]

    exponent = exponent[1:]
    
    return (sign, fraction, exponent)


import numpy as np

# Example matrix A
A = np.array([[4, 12, -16],
              [12, 37, -43],
              [-16, -43, 98]])

# Cholesky decomposition
L = np.linalg.cholesky(A)

# Compute determinant
det_A = np.linalg.det(L) ** 2

print("Determinant of A:", det_A)

if __name__ == "__main__":
    print(fl(a))
    print(mantissza(t=7, kminusz=-3, kplussz=3)(-3.17))
    print(mantissza(t=7, kminusz=-3, kplussz=3)(10.625))
    print(mantissza(t=7, kminusz=-3, kplussz=3)(7/3))
    print(flForditas(fl(a)))
    print("-"*32)
    print(fl(a))
    print(mantissza(t=7, kminusz=-15, kplussz=15)(a))
    print(mantisszaForditas(mantissza(t=7, kminusz=-15, kplussz=15)(a)))