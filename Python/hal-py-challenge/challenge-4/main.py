class Desc:
    def __init__(self, initial_value):
        self._value = initial_value

    def __get__(self, instance, owner):
        return self._value

    def __set__(self, instance, value):
        if value > self._value:
            self._value = value
        else:
            print("Az új értéknek nagyobbnak kell lennie az előzőnél!")

class MyClass:
    attribute = Desc(0)

# Teszteljük az osztályt
obj = MyClass()

print(obj.attribute)  # Kiír: 0

obj.attribute = 10
print(obj.attribute)  # Kiír: 10

obj.attribute = 5  # Kiír: Az új értéknek nagyobbnak kell lennie az előzőnél!
print(obj.attribute)  # Kiír: 10 (mivel a 5 nem nagyobb, mint 10)
