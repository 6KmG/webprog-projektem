# Házi feladat

# A Melbourne dataset felhasználásával készítsen egy lineáris regresszort a lakásárak (Price) 
# meghatározására, úgy hogy a hiányzó adatokat (numerikus és kategórikus) imputálással pótolja 
# (stratégiát Ön választ, adatot ne dobjon el). A modell építés során numerikus és kategórikus 
# adatokat is használja fel! Az adatokat ossza fel 80% tréning, 20% validációs részre az 
# imputálás után. A modellt értékelje ki MAE, R2 segítségével.

# Folyamatok:

#     adatok betöltése
#     adatok felosztása tréning, teszt DataFramekre
#     adatok (tréning, teszt) szétválasztása numerikus és kategórikus részekre
#     adatok imputálása
#     a kategórikus adatok kódolása
#     numerikus és kategórikus adatok összefűzése (pd.concat([num_X_train, OH_cols_train], axis=1))
#     modell készítése
#     kiértékelés

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error
from sklearn.impute import SimpleImputer
#from sklearn.impute import KNNImputer

# Load the data
data = pd.read_csv('https://raw.githubusercontent.com/karsarobert/Machine_Learning_2024/main/melb_data.csv')

data.info() #sok object típusú adatunk van, amelyek nem számok!

# Select target
y = data.Price

melb_predictors = data.drop(['Price'], axis=1)
X = melb_predictors.select_dtypes(exclude=['object']) #Az egyszerűség kedvéért csak numerikus oszlopokat (prediktorokat) használunk.

# Adatok felosztása tréning és teszt adatokra
X_train, X_valid, y_train, y_valid = train_test_split(X, y, train_size=0.8, test_size=0.2, random_state=0)

# Az összehasonlítás végett megadunk egy függvényt amely az abszolút hibával tér vissza
def score_dataset(X_train, X_valid, y_train, y_valid):
    model = LinearRegression()
    model.fit(X_train, y_train)
    preds = model.predict(X_valid)
    return mean_absolute_error(y_valid, preds)

print(X_train.columns)

# Adatok pótlása
my_imputer = SimpleImputer(strategy='mean') # mean, median, most_frequent, const

imputed_X_train = my_imputer.fit_transform(X_train) # figyeljük meg, hogy a validációs halmaznál már nem alkalmazzuk a fit függvényt
imputed_X_valid = my_imputer.transform(X_valid) # hiszen az adatszivárgáshoz vezetne

#Az imputálás után numpy tömböket kapunk elegánsabb ezeket vissza alakítani pandas dataframe formátumba
#imputed_X_train = pd.DataFrame(my_imputer.fit_transform(X_train)) #numpy ndarray típusból pandas dataframe
#imputed_X_valid = pd.DataFrame(my_imputer.transform(X_valid))

# Az imputáció során az oszlopnevek elvesznek, ezeket vissza állítjuk
#imputed_X_train.columns = X_train.columns
#imputed_X_valid.columns = X_valid.columns

print("MAE a 2. megközelítésből (imputálás):")
print(score_dataset(imputed_X_train, imputed_X_valid, y_train, y_valid))

# Máslatot készítünk az eredeti adatainkról
X_train_plus = X_train.copy()
X_valid_plus = X_valid.copy()

# Visszatér  a hiányzó értékeket tartalmazó oszlopok neveivel egy listában
cols_with_missing = [col for col in X_train.columns if X_train[col].isnull().any()] # ha üres adat egyszer is előfordul

# A tréning és validációs adatokra is elvégezzük az átalakítást
reduced_X_train = X_train.drop(cols_with_missing, axis=1) #itt most oszlopokat dobunk el korábban csak sorokat df.dropna(inplace=True) 2. gyakorlaton
reduced_X_valid = X_valid.drop(cols_with_missing, axis=1)

print("MAE az 1. megközelítésből (a hiányzó értékeket tartalmazó oszlopok elhagyása):")
print(score_dataset(reduced_X_train, reduced_X_valid, y_train, y_valid))

# Új oszlopokat generálunk az imputált adatok jelzésére
for col in cols_with_missing:
    X_train_plus[col + '_was_missing'] = X_train_plus[col].isnull() #az új oszlop értékét pedig 1-re állítjuk ha hiány volt
    X_valid_plus[col + '_was_missing'] = X_valid_plus[col].isnull()

# Imputáció
my_imputer = SimpleImputer(strategy='mean')
imputed_X_train_plus = pd.DataFrame(my_imputer.fit_transform(X_train_plus))
imputed_X_valid_plus = pd.DataFrame(my_imputer.transform(X_valid_plus))

# Az imputáció során az oszlopnevek elvesznek, ezeket vissza állítjuk
imputed_X_train_plus.columns = X_train_plus.columns
imputed_X_valid_plus.columns = X_valid_plus.columns

print("MAE a 3. megközelítésből (Az imputáció kiterjesztése):")
print(score_dataset(imputed_X_train_plus, imputed_X_valid_plus, y_train, y_valid))

print(imputed_X_train_plus.head())

print(X_train.head())

cat_imp = SimpleImputer(strategy="most_frequent")
X_catimp = pd.DataFrame(cat_imp.fit_transform(X))
X_catimp.columns = X.columns
X_catimp.info()

import numpy as np
from sklearn.impute import KNNImputer
nan = np.nan
X = np.array([[1, 2, nan], [3, 4, 3], [nan, 6, 5], [8, 8, 7]])
imputer = KNNImputer(n_neighbors=3, weights="uniform") # 'uniform' : egységes súlyok, az egyes szomszédságok minden pontja egyenlő súlyozású
print(X)
print()
print(imputer.fit_transform(X)) # 1+3+8/3

import pandas as pd
from sklearn.model_selection import train_test_split

data = pd.read_csv('https://raw.githubusercontent.com/karsarobert/Machine_Learning_2024/main/melb_data.csv')

y = data.Price
X = data.drop(['Price'], axis=1)

print(X.info)

X.sort_values(by=['Regionname'], inplace=True, ascending=True)
print(X.head())

cat_imp = SimpleImputer(strategy="most_frequent")
X_catimp = pd.DataFrame(cat_imp.fit_transform(X))
X_catimp.columns = X.columns
X_catimp.info()