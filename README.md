
# Flutter Multi-App Project 🚀

This repository contains **three Flutter applications** built with proper state management and design patterns. Each app is fully responsive and designed with a clear UI/UX approach.

## 📦 Project Structure

```bash
.
├── travel_app/           # Travel App (Basic navigation)
├── burger_shop_app/      # Burger Shop App (Provider + MVC)
└── coffee_shop_app/      # Coffee Shop App (GetX + MVC)
```

---

## 1️⃣ Travel App

### ✨ Features:
- **Home Page:** 
  - Displays travel destinations.
  - Clickable images that navigate to the **Details Page**.

- **Product Details Page:** 
  - Shows a short description of the selected travel destination.

### 📌 Notes:
- Simple navigation using `Navigator`.
- Stateless architecture.

---

## 2️⃣ Burger Shop App (Provider + MVC)

### 🧩 Architecture:
- Follows **MVC Design Pattern**.
- Uses **Provider** for state management.

### 🧑‍🍳 Pages:
- **Onboarding Page**: (Optional setup screen).
- **Home Page**:
  - List of burger items.
  - Tab bar to filter items.
  - Bottom navigation bar (non-functional).
- **Product Details Page**:
  - Product description.
  - **Add to Cart** button.
- **Cart Page**:
  - Displays added items.
  - User can increase quantity or remove items.

### 💡 Notes:
- Fully responsive UI.
- No favorite or quantity counter on product detail page.

---

## 3️⃣ Coffee Shop App (GetX + MVC)

### 🧩 Architecture:
- Follows **MVC Design Pattern**.
- Uses **GetX** for state management.

### ☕ Pages:
- **Onboarding Page**:
  - Button navigates to **Home Page**.
- **Home Page**:
  - Displays list of coffee products.
  - Tab bar for filtering items.
  - Bottom navigation bar (non-functional).
- **Product Details Page**:
  - Product description.
  - **Add to Cart** button.
- **Cart Page**:
  - Add/remove items.
  - Change quantity.
  
### 🔑 Notes:
- No favorite or quantity counter on details screen.
- Custom design allowed for the cart page.

---

## 🛠 Requirements

- ✅ Flutter (latest stable version)
- ✅ Android Studio or VSCode
- ✅ Proper device/emulator setup

Install Flutter: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

---

## 🧪 Running the Apps

Navigate into any project directory and run:

```bash
flutter pub get
flutter run
```

---

## 🤝 Contributing

Pull reques ts are welcome except BEDO ! For major changes, please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is licensed under the MIT License.

---

## 🔗 Useful Links

- [Flutter Documentation](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [GetX Package](https://pub.dev/packages/get)

```

---

Let me know if you want a `pubspec.yaml`, `main.dart`, or folder structure for any of the apps to go with this `README.md`.
