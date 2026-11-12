<div align="center">

# CHROMA
### Color Palette Studio

Generate, explore, and manage color palettes from images.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
![Status](https://img.shields.io/badge/Status-Academic%20Project-blue)

</div>

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack](#tech-stack)
- [App Screens](#app-screens)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Data Storage](#data-storage)
- [Authentication](#authentication)
- [Roadmap](#roadmap)
- [Team](#team)

---

## Overview

**CHROMA** is a Flutter-based mobile application that lets users extract dominant colors from images and organize them into reusable palettes. Users can pick a photo from the gallery or capture one with the camera, inspect each color in detail, and save palettes for later use.

It is built for designers, students, and anyone who works with color in digital and creative projects.

## Features

| Feature | Description |
|---|---|
| **Sign-in Interface** | Sign-in screen with guest access |
| **Image Selection** | Pick from the gallery or capture with the camera |
| **Color Extraction** | Automatically detect dominant colors in an image |
| **Color Details** | View HEX, RGB, and HSL values for each color |
| **Color Variations** | Explore lighter and darker shades of any color |
| **Palette Management** | Save, view, and delete generated palettes |
| **Theme Support** | Light and dark modes |
| **Clipboard Support** | Copy color codes with one tap |
| **User Profile** | Access profile and app settings |

## Screenshots

> Add screenshots to an `assets/screenshots/` folder and update the paths below.

| Home | Generated Palette | Color Details | Saved Palettes |
|:---:|:---:|:---:|:---:|
| ![Home](assets/screenshots/home.png) | ![Palette](assets/screenshots/palette.png) | ![Details](assets/screenshots/details.png) | ![Saved](assets/screenshots/saved.png) |

## Tech Stack

| Technology | Purpose |
|---|---|
| [Flutter](https://flutter.dev) | Cross-platform mobile framework |
| [Dart](https://dart.dev) | Programming language |
| [Android Studio](https://developer.android.com/studio) | Development environment |
| [`image_picker`](https://pub.dev/packages/image_picker) | Gallery access and camera capture |
| [`palette_generator`](https://pub.dev/packages/palette_generator) | Dominant color extraction |
| [`shared_preferences`](https://pub.dev/packages/shared_preferences) | Local data storage |

## App Screens

1. **Sign In**
2. **Welcome**
3. **Home Dashboard**
4. **Camera**
5. **Image Preview**
6. **Generated Palette**
7. **Color Details**
8. **Saved Palettes**
9. **Profile & Settings**

## Project Structure

```
lib/
├── main.dart
├── theme/
│   ├── app_colors.dart
│   ├── app_theme.dart
│   └── theme_controller.dart
├── screens/
│   ├── signin_screen.dart
│   ├── welcome_screen.dart
│   ├── home_screen.dart
│   ├── camera_screen.dart
│   ├── image_preview_screen.dart
│   ├── palette_screen.dart
│   ├── color_details_screen.dart
│   ├── saved_screen.dart
│   └── profile_screen.dart
├── widgets/
│   ├── color_swatch.dart
│   ├── app_button.dart
│   └── bottom_navigation.dart
├── models/
│   └── palette_model.dart
└── services/
    ├── color_extraction_service.dart
    └── storage_service.dart
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (bundled with Flutter)
- Android Studio
- Android emulator or a physical Android device

### Installation

```bash
# 1. Clone the repository
git clone <repository-url>

# 2. Move into the project directory
cd colorpalatte

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

## Data Storage

CHROMA stores saved palettes and app settings locally on the device using **Shared Preferences**. No remote database is required.

## Authentication

The sign-in screen is a **front-end demonstration only**. It does not connect to an authentication service or backend.

## Roadmap

- [ ] Cloud synchronization for saved palettes
- [ ] User account authentication
- [ ] Export palettes in multiple formats
- [ ] Additional color harmony tools
- [ ] Improved palette customization

## Team

Developed as an academic group project.

| Name | Role |
|---|---|
| _Your Name_ | _Role_ |
| _Teammate Name_ | _Role_ |

---

<div align="center">
Made with Flutter 💙
</div>
