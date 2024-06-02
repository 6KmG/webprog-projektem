class IPCalc:
    def __init__(self, ip: str):
        self._data = ip
    
    def __str__(self):
        return self._data

    def getBinary(self):
        binary = '.'.join([bin(int(x)+256)[3:] for x in self._data.split('.')])
        return binary

    def getType(self):
        number = int(self._data.split('.')[0])
        if number < 128:
            return 'A'
        elif number < 192:
            return 'B'
        elif number < 224:
            return 'C'
        elif number < 240:
            return 'D'
        else:
            return 'E'

    def getMask(self, hosts=None, subnets=None):
        baseMask = None
        match self._data.getType():
            case 'A':
                baseMask = "255.0.0.0"
            case 'B':
                baseMask = "255.255.0.0"
            case 'C':
                baseMask = "255.255.255.0"
            case _:
                return None

        if subnets == None and hosts == None:
            return baseMask
        



ip = IPCalc("203.4.106.0")
print(ip.getBinary())
print(ip.getType())