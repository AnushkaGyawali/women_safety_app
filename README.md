# 👩‍💼 Women Security App

## 🛡️ Overview

**Women Security App** is a mobile safety solution designed to protect women, especially during solo travel or late-night commutes. Built for Android devices using Flutter, the app combines real-time location tracking, emergency alerts, and self-defense resources into a single, easy-to-use platform. Inspired by the principle “prevention is better than cure,” it empowers users to act swiftly in dangerous situations.

---

## 💡 Motivation

The idea emerged from rising incidents of violence against women in South Asia, including the tragic **Balkhu case (2018)**. Cases of harassment, domestic abuse, and sexual assault underscore the urgent need for smart safety tools. This app is a step toward providing women with reliable, real-time security options in today’s fast-moving world.

---

## 🔑 Core Features

* **🆘 Emergency SOS with Live Location**
  Sends an SMS with a custom message and real-time location (via OpenStreetMap link) to trusted contacts.

* **🔊 Fake Siren Alarm**
  Emits a loud siren to deter attackers and alert bystanders.

* **📍 Live Location Tracking**
  Continuously uploads location to **Firebase Firestore** for emergency sharing.

* **🛡️ Self-Defense & Safety Tips**
  Provides offline-accessible safety advice and self-defense techniques.

* **🔐 User Authentication**
  Secure sign-up and login system to protect user data.

* **📞 Emergency Contact Management**
  Add, edit, or delete up to three trusted contacts.

* **📳 Shake/Volume Trigger**
  Shake the device or press volume buttons to activate SOS alert instantly.

---

## 🤭 App Architecture & Flow

**Simplified Flow:**

```
[User Action]
     ↓
[Trigger Activated]
     ↓
[Get Current Location]
     ↓
[Send SMS to Trusted Contacts]
```

### 🎭 Use Case Diagram

**Actors:**

* **User**: Registers, manages contacts, triggers SOS, plays siren
* **Guardian**: Receives SOS messages and location updates

---

## 🛠️ Technology Stack

| Category              | Tech Used                                   |
| --------------------- | ------------------------------------------- |
| Frontend              | Flutter (Dart)                              |
| Backend Services      | Firebase (Auth, Firestore, Cloud Functions) |
| Location Services     | OpenStreetMap API                           |
| SMS Integration       | Twilio Programmable SMS API                 |
| Background Processing | `flutter_background`, `permission_handler`  |

---

## 🧪 Development Environment

| Resource          | Details                |
| ----------------- | ---------------------- |
| Platform          | Windows 10             |
| IDE               | Android Studio 3.6.1   |
| Processor         | Intel Core i5          |
| RAM               | 8 GB                   |
| AVD Used          | Pixel 2 (Emulator)     |
| Location Hardware | Device GPS             |
| Flutter SDK       | Compatible with Dart 3 |

---

## 📱 User Device Requirements

* **Android Version**: 4.4 or higher
* **RAM**: Minimum 1–2 GB
* **Network**: 2G/3G/4G recommended
* **Permissions**: Location, SMS, Contacts, Microphone

---

## 🚀 Installation & Setup

1. **Clone the Repository**

   ```bash
   git clone <repository_url>
   cd WomenSecurityApp
   ```

2. **Install Flutter & Dependencies**

   * Follow [Flutter installation guide](https://flutter.dev/docs/get-started/install)
   * Run:

     ```bash
     flutter pub get
     ```

3. **Configure Firebase**

   * Create a Firebase project
   * Add Android app to Firebase
   * Download `google-services.json` → place it in `android/app/`
   * Enable:

     * Firebase Auth
     * Firestore
     * Cloud Functions

4. **Set Up Twilio**

   * Create a Twilio account
   * Get Account SID and Auth Token
   * Securely configure credentials (preferably in Cloud Functions)

5. **Run the App**

   ```bash
   flutter run
   ```

   Ensure your device/emulator is connected with **USB Debugging** enabled.

---

## 🎮 Usage Guide

* **Register/Login**: Create a new account or sign in.
* **Add Contacts**: Go to *Trusted Contacts* to add up to three emergency numbers.
* **Trigger SOS**:

  * Shake device or press volume buttons
  * OR tap the **SOS** button
    → Sends SMS with real-time location
* **Sound Alarm**: Tap the **Siren** button to activate alert sound.
* **Safety Tips**: Explore tips and self-defense guides from the dedicated tab.

---

## 🤖 Challenges & Solutions

| Challenge                                   | Solution                                          |
| ------------------------------------------- | ------------------------------------------------- |
| Multi-permission Handling                   | Used `permission_handler` to streamline checks    |
| Background Task Execution                   | Utilized `flutter_background` for SOS reliability |
| Device Compatibility for Triggers           | Fine-tuned sensor thresholds and logic            |
| Smooth UX for Critical Actions              | Prioritized simple UI, fast response              |
| Data Security & Syncing                     | Leveraged Firebase Auth and Firestore             |
| Error Recovery & Feedback                   | Added proper exception handling & alerts          |
| Third-Party Integration (e.g., OSM, Twilio) | Researched Dart-compatible packages and fallbacks |

---

## 🔮 Future Enhancements

* **AI/ML for Predictive Danger Zones**
* **iOS Support**
* **Multilingual Support (Nepali, Hindi, etc.)**
* **In-app Chat/Calling with Guardians**
* **Community Alerts & Anonymous Reporting**
* **Direct Link to Law Enforcement (with consent)**

---

## 👌 Contributing

Pull requests are welcome!

## 📄 License

This project is licensed under the MIT License .
