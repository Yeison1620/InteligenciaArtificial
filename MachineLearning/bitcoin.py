import pandas as pd
import numpy  as np
from sklearn.metrics import r2_score
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Importo los datos del archivo 
data = pd.read_csv("MachineLearning/tesla_data.csv")
print ("Tabla de datos: \n", data)

# Selecciono las características  y la variable objetivo 
respuesta = data[['Cumulative Open']]
explicativas = data[['Open', 'High','Low','Close','Volume']]
explicativas = explicativas.dropna()
print ("Datos seleccionados: \n ",explicativas)

# Divido los datos en conjuntos de entrenamiento y prueba
X_train, X_test, Y_train, Y_test = train_test_split(explicativas, respuesta, test_size=0.5, random_state=150)
print ("Entrenamiento: \n", X_train)

# Entrenar el modelo de regresión lineal
model = LinearRegression()
model.fit(X_train, Y_train)

# Realizo predicciones en el conjunto de prueba
Y_pred = model.predict(X_test)
print ("Prediccion: \n",Y_pred)

# Calculao el error 
r2 = r2_score(Y_test,Y_pred)
print ("\n Coeficiente de Determinacion: \n",r2)

# imprimo los coeficientes y la intersección del modelo
print("\nCoeficientes: ", model.coef_)
print("\nIntersección: ", model.intercept_)