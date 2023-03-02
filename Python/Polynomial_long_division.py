myinput = input() # 5x + 3x = 10
variables = []

for i in range(2):
    for i in range(len(myinput)):
        if myinput[i] == 'x':
            variables.append(myinput[0:i+1])
            myinput = myinput[i+1:len(myinput)]
            break
        if myinput[i] == '+' or myinput[i] == '-' or myinput[i] == '*' or myinput[i] == '/':
            pass


print(myinput)