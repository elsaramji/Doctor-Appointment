# Cure App

A comprehensive mobile healthcare solution built with Flutter, focusing on performance, scalability, and clean code practices.

## 📱 Demo

Test the app on your Android device:
<p align="center">
  <a href="https://drive.google.com/file/d/16t6lNsS4I3iejWIFy2h_QPO727QX27oT/view">
    <img src="https://img.shields.io/badge/Download-Android%20Demo%20APK-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Download APK" />
  </a>
</p>

[**Direct Link to APK**](https://drive.google.com/file/d/16t6lNsS4I3iejWIFy2h_QPO727QX27oT/view)

## 🚀 Key Features & Strong Points

### 🏗 Architecture & Code Quality

- **Clean Architecture**: Strictly separated `Data`, `Domain`, and `Presentation` layers for testability and maintainability.
- **Dependency Injection**: Utilizes `GetIt` and `Injectable` for loose coupling and easy module management.
- **Functional Programming**: Leverages `dartz` for Either types and error handling, ensuring robust logic.
- **Code Generation**: Uses `Freezed` and `JsonSerializable` to reduce boilerplate and ensure immutability.

### 🛠 Tech Stack & Libraries

- **State Management**: `flutter_bloc` for predictable state transitions.
- **Navigation**: `go_router` for declarative and deep-linkable routing.
- **Networking**: `dio` with `pretty_dio_logger` for powerful HTTP requests and debugging.
- **UI & Responsiveness**: `flutter_screenutil` ensuring pixel-perfect designs across all screen sizes.
- **Maps**: `flutter_map` & `latlong2` for location-based services.
- **Real-time Communication**: `flutter_webrtc` for video/audio calls.
- **Storage**: `flutter_secure_storage` for sensitive data encryption.

### ✨ App Capabilities

- **Authentication**: Secure login and registration flows.
- **Doctor Booking**: Full appointment scheduling system.
- **Chat & Video Calls**: Integrated real-time communication between patients and doctors (using WebRTC) my Task.
- **Search**: Advanced filtering to find the right specialists.
- **Interactive Maps**: Locate clinics and doctors nearby.

## 📦 Getting Started

1. Clone the repository.
2. Run `flutter pub get`.
3. Generate code files: `dart run build_runner build`.
4. Run the app: `flutter run`.

---
*Built with ❤️ by Team 4 In Huma Volve Round 7*
