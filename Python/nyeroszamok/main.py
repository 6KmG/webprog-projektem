def importLottery(fileName: str):
    raw = open(fileName, "r").read()
    process = raw.split("<tr>")
    for i in range(len(process)):
        process[i] = process[i].strip("\n")
        process[i] = process[i].strip("/tr>")
        process[i] = process[i].strip("<")
        process[i] = process[i].split("<td>")
        for j in range(len(process[i])):
            process[i][j] = process[i][j].strip("</td>")
    while process[0][0].isdigit() == False:
        process.remove(process[0])
    process[-1][-1] = process[-1][-1].strip("</td></tr>\n</tbody></table>\n\n</body></html")

    return process

def countNumbers(process, weekBack = 54):
    array = []
    for i in range(90):
        array.append(0)

    iter = 0
    for iter in range(weekBack):
        for j in range(len(process[0])-5, len(process[0])):
            array[int(process[iter][j])-1] += 1
    
    print("The numbers has been counted as back as: " + process[iter - 1][2])

    return array

def filterBestNumbers(array, quantity = 5):
    bestNumbers = []

    for i in range(quantity):
        node = 0
        place = 0
        for j in range(90):
            if node < array[j]:
                node = array[j]
                place = j
        array[place] = 0
        bestNumbers.append(((place + 1), "quantity = " + str(node)))

    return bestNumbers

def getElementByYearAndWeek(process, year: int, week: int):
    for i in range(len(process)):
        if year == int(process[i][0]):
            if week == int(process[i][1]):
                return process[i]
        i += 54

        if process[i][3] != '0':
            if process[i][3] != '':
                return process[i]

if __name__ == "__main__":
    process = importLottery("skandi.html")
    array = countNumbers(process, weekBack=54*2)
    print(array)
    bestNumbers = filterBestNumbers(array, 7)
    for element in bestNumbers:
        print(element, end="\n")
