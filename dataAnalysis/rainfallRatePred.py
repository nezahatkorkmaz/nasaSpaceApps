import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import itertools
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.ensemble import RandomForestClassifier, RandomForestRegressor
import lightgbm as lgb
import catboost as cb
import xgboost as xgb
from mlxtend.classifier import EnsembleVoteClassifier
from mlxtend.plotting import plot_decision_regions
from sklearn.metrics import accuracy_score, mean_squared_error
from sklearn.model_selection import train_test_split

# Splitting the data into training and test sets
X = MiceImputed[["Sunshine", "Humidity9am", "Cloud3pm"]] # Features
y_rain = MiceImputed["RainTomorrow"]  # Binary classification target
y_rainfall = MiceImputed["Rainfall"]  # Regression target

# Convert to numpy arrays
X = np.asarray(X, dtype=np.float32)
y_rain = np.asarray(y_rain, dtype=np.int32)
y_rainfall = np.asarray(y_rainfall, dtype=np.float32)

# Split the dataset into training and test sets
X_train, X_test, y_rain_train, y_rain_test, y_rainfall_train, y_rainfall_test = train_test_split(X, y_rain, y_rainfall, test_size=0.3, random_state=42)

# Initialize classifiers
clf_rain = RandomForestClassifier(random_state=12345)
reg_rainfall = RandomForestRegressor(random_state=12345)

# Train the models
clf_rain.fit(X_train, y_rain_train)  # For predicting rain tomorrow (binary classification)
reg_rainfall.fit(X_train, y_rainfall_train)  # For predicting rainfall amount (regression)

# Predictions
y_rain_pred = clf_rain.predict(X_test)
y_rainfall_pred = reg_rainfall.predict(X_test)

# Evaluate the models
accuracy = accuracy_score(y_rain_test, y_rain_pred)
mse = mean_squared_error(y_rainfall_test, y_rainfall_pred)

print(f"Rain Prediction Accuracy: {accuracy * 100:.2f}%")
print(f"Rainfall Prediction MSE: {mse:.4f}")

# Visualizing the Decision Regions for Rain Prediction
gs = gridspec.GridSpec(1,1)
fig = plt.figure(figsize=(8, 6))

clf_rain.fit(X_train, y_rain_train)
ax = plt.subplot(gs[0, 0])
plot_decision_regions(X=X_test, y=y_rain_test, clf=clf_rain, filler_feature_values={2: 1.80}, filler_feature_ranges={2: 0.90}, legend=2)
plt.title("Random Forest Rain Prediction")
plt.show()
