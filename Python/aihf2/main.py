# Házi feladat diabetes adatcsomag betöltése, 
# az oszlopok elemszámának ellenőrzése, 
# ha kell korrigálása. Számítsa ki az egyes oszlopok 
# átlagait cimkénként (label) 0 és 1 es cimkék vannak. 
# Válogassuk le azokat az adatokat ahol a szülések száma 
# kisebb mint 10. 
# Rajzoljon korellációs mátrixot. 
# Rajzolja meg az adatkészlethez tartozó hisztogramokat, 
# milyen eloszlásokat ismer fel? 
# Visszaküldési határidő: 2024.02.20!

import matplotlib.pyplot as pyplot
import pandas
import numpy

def loadCsv(url: str) -> pandas.core.frame.DataFrame:
    return pandas.read_csv(url)

def getDataframeMean(dataframe: pandas.core.frame.DataFrame) -> pandas.core.series.Series:
    # columnNames = list(labelledDataframe.columns)
    # columnNames.remove("label")
    return dataframe.mean()

def sortLabelledDataframe(dataframe: pandas.core.frame.DataFrame, label: bool) -> pandas.core.frame.DataFrame:
    return dataframe[dataframe["label"] == label]

def sortOlderThanDataframe(dataframe: pandas.core.frame.DataFrame, age: int) -> pandas.core.frame.DataFrame:
    return dataframe[dataframe["age"] > age]

def drawCorrelationMatrix(dataframe: pandas.core.frame.DataFrame) -> None:
    correlations = dataframe.corr()
    figure = pyplot.figure(figsize=(10, 10))
    axes = figure.add_subplot(1,1,1)
    names = list(dataframe.columns)
    correlationAxes = axes.matshow(correlations, vmin=-1, vmax=1)
    ticks = numpy.arange(0,len(names),1)

    figure.colorbar(correlationAxes)
    axes.set_xticks(ticks)
    axes.set_yticks(ticks)

    axes.set_xticklabels(names, rotation=90)
    axes.set_yticklabels(names)

    pyplot.show()

def drawHistogram(dataframe: pandas.core.frame.DataFrame) -> None:
    dataframe.hist(figsize=(15,15))
    pyplot.show()

if __name__ == "__main__":
    url = "https://raw.githubusercontent.com/karsarobert/Machine_Learning_2024/main/diabetes.csv"
    dataframe = loadCsv(url)

    print(sortLabelledDataframe(dataframe=dataframe, label=1))
    print(sortLabelledDataframe(dataframe=dataframe, label=0))

    print(sortOlderThanDataframe(dataframe=dataframe, age=10))

    print(getDataframeMean(sortLabelledDataframe(dataframe=sortOlderThanDataframe(dataframe=dataframe, age=50), label=1)))

    drawCorrelationMatrix(dataframe=dataframe)

    drawHistogram(dataframe=dataframe)