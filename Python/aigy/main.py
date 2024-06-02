import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import Pipeline
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report, confusion_matrix

# Adatok betöltése
data = pd.read_csv("https://raw.githubusercontent.com/karsarobert/Machine_Learning_2024/main/spam.csv", encoding='latin-1')
data = data.drop(["Unnamed: 2", "Unnamed: 3", "Unnamed: 4"], axis=1)
data = data.rename(columns={"v1": "label", "v2": "text"})

# Label kódolása
data['label'] = data['label'].map({'ham': 0, 'spam': 1})

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(data['text'], data['label'], test_size=0.2, random_state=42)

# Pipeline létrehozása
pipeline = Pipeline([
    ('vect', CountVectorizer()),
    ('clf', MultinomialNB())
])

vect__ngram_range = []
clf__alpha = []

VECT_NGRAM_LEN = 3
for i in range(0, VECT_NGRAM_LEN):
    for j in range(i, VECT_NGRAM_LEN):
        vect__ngram_range.append((i, j))

vect__ngram_range = [(0,1)]

NUM_OF_CLF_ALPHA = 11
SHRINK_CLF_ALPHA = 8
CLF_ALPHA_RESOLUTION = 0.5
for i in range(SHRINK_CLF_ALPHA, int(NUM_OF_CLF_ALPHA / CLF_ALPHA_RESOLUTION)):
    clf__alpha.append((1/i)*CLF_ALPHA_RESOLUTION)

class __optimal:
    vect__ngram_range = [(1, 2)]
    vect__analyzer = ['word']
    clf__alpha = (0.1,)
    clf__fit_prior = [True]

# Hiperparaméterek beállítása
parameters = {
    'vect__ngram_range': vect__ngram_range,
    'vect__analyzer': ['word', 'char', 'char_wb'],
    'clf__alpha': clf__alpha,
    'clf__fit_prior': [True, False]
}

# Kommentelje ki, ha inkább keresne jobb paramétereket szeretne
parameters = {
    'vect__ngram_range': __optimal.vect__ngram_range,
    'vect__analyzer': __optimal.vect__analyzer,
    'clf__alpha': __optimal.clf__alpha,
    'clf__fit_prior': __optimal.clf__fit_prior
}

# GridSearchCV létrehozása
grid_search = GridSearchCV(pipeline, parameters, n_jobs=-1, verbose=1)

# Modell illesztése
grid_search.fit(X_train, y_train)

# Legjobb beállítások
optimal_parameters = grid_search.best_estimator_.get_params()
print("Legjobb beállítások:")
for param_name in sorted(parameters.keys()):
    print(f"\t{param_name}: {optimal_parameters[param_name]}")

# Tesztelés
y_pred = grid_search.predict(X_test)

# Eredmények kiértékelése
print("\nClassification Report:")
print(classification_report(y_test, y_pred))

# Zavartsági mátrix
print("\nConfusion Matrix:")
print(confusion_matrix(y_test, y_pred))
