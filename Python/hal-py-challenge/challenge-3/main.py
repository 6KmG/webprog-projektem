import random
import warnings

class Matrix:
    def __init__(self, n, name=None):
        # Itt jön létre a mátrix, és fel lesz töltve nullákkal
        self._data = [[0 for _ in range(n)] for _ in range(n)]

        # Itt adom meg a mátrix nevét, ha nem szöveg típusú nevet adtunk meg, akkor az osztály neve "Matrix" lesz a név
        if type(name) == type(str()):
            self.name = name
        else:
            warnings.warn("You haven't provided a proper name to your matrix.")
            self.name = self.__class__.__name__

        for i in range(n):
            for j in range(n):
                self._data[i][j] = random.randint(0, 2)

    def __getitem__(self, index):
        return self._data[index]

    def __setitem__(self, index, value):
        self._data[index] = value
    
    def __repr__(self):
        return repr(self._data)

    # printeléskor hívódik meg
    def __str__(self):
        # Két nagyon hosszú sor amit még én sem értek teljesen, de azért felelős, hogy szépen kiírja a mátrixot
        data_str = f"{self.name} = |{', '.join(map(str, self._data[0]))}|"
        data_str += '\n' + '\n'.join(' '*(len(self.name) + 3)+f'|{", ".join(map(str, row))}|' for row in self._data[1:])
        return data_str

if __name__ == "__main__":
    matrix = Matrix(3, 'a')
    print(matrix)
