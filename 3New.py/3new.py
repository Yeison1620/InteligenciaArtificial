import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Datos de entrada y salida de ejemplo
X = [[0, 0], [0, 1], [1, 0], [1, 1]]
Y = [0, 1, 1, 0]

# Dividir los datos en conjuntos de entrenamiento y prueba
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.25, random_state=42)

def build_model(activation_function):
    # Crear un modelo secuencial
    model = Sequential()

    # Agregar capas ocultas con función de activación especificada
    for _ in range(5):
        model.add(Dense(4, activation=activation_function))

    # Agregar la capa de salida con función de activación 'sigmoid'
    model.add(Dense(1, activation='sigmoid'))

    # Compilar el modelo usando el optimizador 'adam' y la pérdida de entropía cruzada binaria
    model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
    
    return model

# Construir y entrenar modelos con diferentes funciones de activación
activation_functions = ['relu', 'tanh', 'sigmoid']
models = []

for activation_function in activation_functions:
    model = build_model(activation_function)
    model.fit(X_train, Y_train, epochs=1000, verbose=0)
    models.append(model)

# Evaluar el rendimiento de cada modelo en el conjunto de prueba
results = []
for i, model in enumerate(models):
    loss, accuracy = model.evaluate(X_test, Y_test, verbose=0)
    predictions = model.predict(X_test)
    rounded_predictions = [round(pred[0]) for pred in predictions]
    accuracy_binary = accuracy_score(Y_test, rounded_predictions)
    
    results.append({
        'activation_function': activation_functions[i],
        'loss': loss,
        'accuracy': accuracy,
        'accuracy_binary': accuracy_binary
    })

# Imprimir los resultados
for result in results:
    print(f"Activation Function: {result['activation_function']}")
    print(f"Loss: {result['loss']:.4f}")
    print(f"Accuracy (Float): {result['accuracy']:.4f}")
    print(f"Accuracy (Binary): {result['accuracy_binary']:.4f}")
    print("\n")

# Encontrar la mejor red neuronal basada en la métrica de precisión (accuracy)
best_model_index = max(range(len(results)), key=lambda i: results[i]['accuracy_binary'])
best_model = models[best_model_index]

print(f"La mejor red neuronal tiene función de activación: {activation_functions[best_model_index]}")
