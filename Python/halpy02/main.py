myvar = 987

print(id(myvar))

othervar = myvar

print(id(othervar))

mylist = [1,2,3,4]
print(id(mylist))
mylist.append(12)
print(mylist)
print(id(mylist))

mytuple = (['a', 'b'],['d', 'e'])
print(id(mytuple))
mytuple[0].append('f')
print(id(mytuple))
num1 = 999
num2 = 999
print(id(num1))
print(id(num2))

list1 = [1,2,3]
list2 = [1,2,3]
print(id(list1))
print(id(list2))

#Strong, weak, circular, reference

class Korkoros:
    def __init__(self):
        self.obj = None
    
obj1 = Korkoros()
obj2 = Korkoros()

obj1.obj = obj2
obj2.obj = obj1

import weakref

class MyClass:
    def __init__(self, value):
        self.value = value

        
obj3 = MyClass("I have a weak reference,")
weak_ref = weakref.ref(obj3)

if weak_ref() is not None:
    print("Az objektum létezik.")
else:
    print("Az objektum felszabadult.")

del obj3

if weak_ref() is not None:
    print("Az objektum létezik.")
else:
    print("Az objektum felszabadult.")

# Argumentum vagy paraméter

def add(x, y): return x+y

print(add(y=5, x=4))

# unpacking

whatami = 9,8,7
whatami2 = int()
a2 = 10
b2 = 20
a2, b2 = b2, a2

print(type(whatami2), whatami2)
print(a2,b2)

s1,s2,s3 = "XYZ"
print(s1)

s = {'h', 'i'}
c1,c2 = s
print(c1,c2)

mydict = {"key1":1, "key2":2, "key3":3}
k1,k2,k3 = mydict.items()
print(k1,k2,k3)

l1,l2,*l3,l4 = [1,2,3,4,5,6,7,8,9,0]
print(l1,l2,l3,l4)

mylist1 = [1,2,3]
mylist2 = [4,5,6]

listsum = [*mylist1, *mylist2]

print(listsum)

# nested unpacking

mylist3= [1,2,3,4,5, "XYZ"]
e1, e2, *e3, (x1,x2,x3) = mylist3

print(e1, e2, e3, x1, x2, x3)

# Feladat1

def avg(*nums):
    return round(sum(nums) / len(nums), 2)

print(avg(2,3,10))

studentdict = {"asd dsa":4, "dsa asd":5, "sad das":4}

print(avg(*studentdict.values()))

numlist1 = [5,14,235346,456,45]
numlist2 = [5,346,346,2,4]
numlist3 = [53,46,457,412]

sumlist = [*numlist1, *numlist2, *numlist3]
print(sumlist)

minvalue, *middvalues, maxvalue = sorted(sumlist)

print(maxvalue, minvalue, middvalues )

