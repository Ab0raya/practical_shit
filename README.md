
# Flutter Multi-App Project , Pandas and ML models 🚀

This repository contains **three Flutter applications** built with proper state management and design patterns. Each app is fully responsive and designed with a clear UI/UX approach.

---

## 📦 Project Structure

```bash
.
├── travel_app/           # Travel App (Basic navigation)
├── burger_shop_app/      # Burger Shop App (Provider + MVC)
├── coffee_shop_app/      # Coffee Shop App (GetX + MVC)
└── ML_Models/            # Machine Learning Notebooks (Pandas + Linear Regression)
    ├── A/
    │   ├── house_price.ipynb
    │   └── pandas_exercise.ipynb
    ├── B/
    │   ├── icecream.ipynb
    │   └── pandas_exercise.ipynb
    └── C/
        ├── Hours_Studied.ipynb
        ├── pandas_exercises.ipynb
        └── data.tsv
````

---

## 1️⃣ Travel App

### ✨ Features:

* **Home Page:**

  * Displays travel destinations.
  * Clickable images that navigate to the **Details Page**.
* **Product Details Page:**

  * Shows a short description of the selected travel destination.

### 📌 Notes:

* Simple navigation using `Navigator`.
* Stateless architecture.

---

## 2️⃣ Burger Shop App (Provider + MVC)

### 🧩 Architecture:

* Follows **MVC Design Pattern**.
* Uses **Provider** for state management.

### 🧑‍🍳 Pages:

* **Onboarding Page**
* **Home Page**
* **Product Details Page**
* **Cart Page**

### 💡 Notes:

* Fully responsive UI.
* No favorite or quantity counter on product detail page.

---

## 3️⃣ Coffee Shop App (GetX + MVC)

### 🧩 Architecture:

* Follows **MVC Design Pattern**.
* Uses **GetX** for state management.

### ☕ Pages:

* **Onboarding Page**
* **Home Page**
* **Product Details Page**
* **Cart Page**

### 🔑 Notes:

* Custom design for the cart page.
* Quantity can be changed, but no favorite option.

---

## 📊 ML Models (Jupyter Notebooks)

This repository also includes **three machine learning notebooks** using Pandas and Linear Regression, located in the `ML_Models/` directory.

### 📚 Contents:

* **[Model A - House Price Prediction](./practical_ML/A/house_price.ipynb)**
* **[Model B - Ice Cream Sales Prediction](./practical_ML/B/icecream.ipynb)**
* **[Model C - Study Hours vs Scores](./practical_ML/C/Hours_Studied.ipynb)**

These are useful for understanding basic regression tasks and data handling with Pandas.

## 🧪 Running the Apps

Navigate into any project directory and run:

```bash
flutter pub get
flutter run
```

---

## 🤝 Contributing

Pull requests are welcome — except BEDO 😆! For major changes, please open an issue first to discuss what you'd like to change.

---



### ✅ To Finish:


Let me know if you'd like this adapted for your actual GitHub URL or want to add live Colab links!

