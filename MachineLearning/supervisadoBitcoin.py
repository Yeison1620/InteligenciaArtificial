import pandas as pd
import numpy as np
from sklearn.metrics import r2_score
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Importo los datos del archivo 
data = pd.read_csv("/content/bitcoin_2017_to_2023.csv")
data

# Selecciono las características  y la variable objetivo 
respuesta = data[['number_of_trades']]
explicativas = data[['open', 'high','low','close','volume']]
explicativas = explicativas.dropna()
explicativas

# Divido los datos en conjuntos de entrenamiento y prueba
X_train, X_test, Y_train, Y_test = train_test_split(explicativas, respuesta, test_size=0.5, random_state=150)
X_train

# Entrenar el modelo de regresión lineal
model = LinearRegression()
model.fit(X_train, Y_train)

# Realizo predicciones en el conjunto de prueba
Y_pred = model.predict(X_test)