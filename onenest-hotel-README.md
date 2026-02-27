# 🏝️ OneNest Hotel — Luxury Resort Booking App

> A fully-featured luxury hotel booking application built with Flutter & Firebase, featuring AI vacation planning, loyalty system, and eco-mode.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google_Maps-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)

---

## 📱 Features

### 🔐 Authentication
- Email / Password sign in & sign up
- Email verification flow
- Firebase Auth integration
- Persistent login with SharedPreferences

### 🛎️ Hotel & Room Management
- Luxury room listings with pricing
- Real-time availability & room count
- Smart Booking Insights (demand, views, booking chance)
- Room details — overview, bed types, bath features, amenities

### 📅 Booking System
- Date selection & guest management (adults/children)
- Coupon & discount code support
- Deposit payment flow
- Booking summary & confirmation
- Cancellation policy handling

### 🤖 AI Vacation Planner
- Multi-step vacation planning wizard
- Travel type selection (couple, family, solo, friends)
- Purpose & budget preferences
- Special requests (ocean view, spa, quiet, etc.)
- Personalized room recommendation with cost breakdown

### 🗺️ Maps & Location
- Google Maps Flutter integration
- Hotel location display
- Nearby attractions
- Get directions support

### 🌱 Eco Mode
- Skip daily cleaning option
- Towel reuse tracking
- CO2 & water savings calculator
- Eco bonus points reward

### 🏆 Loyalty & Achievements
- Points system per booking
- Tier progression (Silver → Gold → Platinum)
- Achievement badges with progress tracking
- Rewards & unlockables

### 🎨 UI/UX
- Dark Mode / Light Mode toggle
- Turkish / English language support
- Smooth fade route transitions
- Responsive design

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter (Dart) |
| Authentication | Firebase Auth |
| Database | Firebase Firestore |
| Maps | Google Maps Flutter |
| State Management | ChangeNotifier |
| Local Storage | SharedPreferences |
| HTTP | http package |
| URL Handling | url_launcher |

---

## 📁 Project Structure

```
lib/
└── main.dart
    ├── DefaultFirebaseOptions     # Firebase config
    ├── LanguageService            # TR/EN localization
    ├── ThemeNotifier              # Dark/Light mode
    ├── AppColors                  # Color palette
    ├── AuthScreen                 # Login & Register
    ├── HomeScreen                 # Main dashboard
    ├── SearchScreen               # Room search & filter
    ├── BookingScreen              # Reservation flow
    ├── PaymentScreen              # Payment processing
    ├── ProfileScreen              # User profile
    ├── MapScreen                  # Google Maps view
    ├── AIVacationPlanner          # AI planning wizard
    ├── EcoModeScreen              # Eco features
    ├── AchievementsScreen         # Loyalty & badges
    ├── LoyaltyService             # Points management
    └── FadeRoute                  # Page transitions
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Firebase project setup
- Google Maps API key

### Installation

```bash
# Clone the repo
git clone https://github.com/bengu-dev/onenest-hotel.git
cd onenest-hotel

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Dependencies (pubspec.yaml)
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest
  firebase_auth: ^latest
  google_maps_flutter: ^latest
  shared_preferences: ^latest
  http: ^latest
  url_launcher: ^latest
```

---

## 🌍 Supported Languages
- 🇬🇧 English
- 🇹🇷 Turkish

---

## 👩‍💻 Author

**Bengü Gedik** — Computer Engineering Student @ Abdullah Gül University

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/bengü-gedik-82a8b8272/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/bengu-dev)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=flat&logo=gmail&logoColor=white)](mailto:bengugedik.123@gmail.com)

---

> ⭐ If you found this project useful, please consider giving it a star!
