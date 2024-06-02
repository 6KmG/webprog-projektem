from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error

import pandas as pd
import numpy as np

# Adatok betöltése
url = 'https://raw.githubusercontent.com/karsarobert/Machine_Learning_2024/main/train.csv'
df = pd.read_csv(url)

# X és y beállítása
y = df['target_reg']
X = df.drop(['target_reg'], axis=1)

# Adatok felosztása tanító és teszt részekre
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=42)

# Korellációs értékek kiszámítása csak a tanító adatokon
X_train_corr = X_train.copy()
X_train_corr['target_reg'] = y_train  # Célváltozó hozzáadása a korreláció számításhoz
corrmat = X_train_corr.corr()
corr_col = corrmat[corrmat['target_reg'] > 0.5].index  # Az index használata a korreláló változók kiválasztásához

# Változók kiválasztása a korreláló oszlopok alapján
X_train_selected = X_train[corr_col.drop('target_reg')]
X_test_selected = X_test[corr_col.drop('target_reg')]

from sklearn.model_selection import RandomizedSearchCV

# Define the parameter grid
param_grid = {
    'n_estimators': list(range(150, 180)),
    'max_depth': [None],
    'max_features': [1.0],
    'min_samples_split': [2],
    'min_samples_leaf': [1]
}

# Create the base model to tune
rf = RandomForestRegressor(random_state=42)

# Instantiate the random search and fit it
random_search = RandomizedSearchCV(estimator=rf, param_distributions=param_grid, 
                                   n_iter=100, cv=3, verbose=2, random_state=42, n_jobs=-1)

# Fit the random search model
random_search.fit(X_train_selected, y_train)

# Print the best parameters and best score
print("Best parameters found: ", random_search.best_params_)
print("Best cross-validation score: ", random_search.best_score_)

# Use the best model to make predictions on the test set
best_rf_model = random_search.best_estimator_
best_rf_predictions = best_rf_model.predict(X_test_selected)

# Calculate MAE for the best model
best_rf_mae = mean_absolute_error(y_test, best_rf_predictions)
print(f'Optimized Random Forest MAE: {best_rf_mae}')
