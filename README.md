# Flutter Template

A comprehensive Flutter boilerplate project designed to accelerate development with essential features, modular architecture, and production-ready setup.

## 🚀 Features

### Core Features
- **🔐 Authentication System** - Complete authentication flow with OTP verification
- **🌐 Multi-language Support** - Internationalization with English, German, and Polish
- **🔔 Push Notifications** - Firebase Cloud Messaging integration
- **📱 Responsive Design** - Adaptive UI for different screen sizes
- **🌙 Theme Configuration** - Customizable app theming
- **🔌 Connectivity Monitoring** - Real-time network status tracking
- **📄 Content Management** - Dynamic content fetching and caching
- **👤 User Management** - Complete user profile and preferences system
- **🔄 App Restart** - Programmatic app restart functionality
- **📱 Multi-platform** - Android, iOS, Web, macOS, and Linux support

### Architecture & Patterns
- **BLoC Pattern** - State management using flutter_bloc
- **Repository Pattern** - Clean separation of data sources
- **Modular Structure** - Feature-based organization
- **Dependency Injection** - Using repository providers
- **Clean Architecture** - Separation of concerns

## 📦 Included Packages

### Custom Packages (located in `/packages`)
- **`app_logger`** - Centralized logging system
- **`app_authentication`** - Authentication management
- **`api_client`** - HTTP client with Dio integration
- **`app_storage`** - Local storage management with GetStorage
- **`app_restart`** - App restart functionality
- **`app_assets`** - Asset management
- **`s3_client`** - AWS S3 integration

### Third-party Dependencies
- **UI/UX**: `google_fonts`, `flutter_svg`, `pin_code_fields`
- **State Management**: `flutter_bloc`, `bloc`, `equatable`
- **Networking**: `dio`, `connectivity_plus`
- **Firebase**: `firebase_core`, `firebase_messaging`
- **Notifications**: `flutter_local_notifications`
- **Storage**: `path_provider`
- **Localization**: `flutter_localizations`
- **Serialization**: `json_annotation`, `json_serializable`

## 🏗️ Project Structure

```
lib/
├── app.dart                 # Main app configuration
├── main.dart               # App entry point
├── features/               # Feature modules
│   ├── authentication/     # Auth-related features
│   ├── connectivity/       # Network connectivity
│   ├── content/           # Content management
│   ├── locale/            # Internationalization
│   ├── notification/      # Push notifications
│   └── user/              # User management
├── helpers/               # Helper utilities
├── l10n/                  # Localization files
├── presentation/          # UI screens and widgets
│   ├── home/
│   ├── login/
│   ├── splash/
│   └── widgets/
├── utils/                 # Utility classes
└── widgets/               # Reusable UI components

packages/                  # Custom packages
├── api_client/
├── app_assets/
├── app_authentication/
├── app_logger/
├── app_restart/
├── app_storage/
└── s3_client/
```

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK (>=3.8.1)
- Dart SDK (>=3.4.3)
- Firebase CLI
- Android Studio / Xcode (for mobile development)

### 1. Clone and Install

```bash
git clone <repository-url>
cd flutter_template
flutter pub get
```

### 2. Install Package Dependencies

```bash
# Install dependencies for all packages
cd packages/app_logger && flutter pub get && cd ../..
cd packages/app_authentication && flutter pub get && cd ../..
cd packages/api_client && flutter pub get && cd ../..
cd packages/app_storage && flutter pub get && cd ../..
cd packages/app_restart && flutter pub get && cd ../..
cd packages/app_assets && flutter pub get && cd ../..
cd packages/s3_client && flutter pub get && cd ../..
```

### 3. Generate Code

```bash
flutter packages pub run build_runner build
```

## 🔥 Firebase Setup

This project includes Firebase integration for messaging and analytics. Use the provided script to initialize Firebase configuration:

### Initialize Firebase for Different Environments

```bash
# For Staging Environment
./init_firebase.sh staging

# For Production Environment
./init_firebase.sh production
```

### Manual Firebase Setup
1. Create Firebase projects for staging and production
2. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
3. Place configuration files in appropriate flavor directories:
   - Android: `android/app/src/staging/` and `android/app/src/production/`
   - iOS: `ios/flavors/staging/` and `ios/flavors/production/`

## 🎯 Flavors Configuration

This template supports multiple build flavors for different environments:

### Available Flavors
- **Production** - Production environment configuration
- **Staging** - Staging/testing environment configuration

### Flavor Structure
```
android/app/src/
├── main/                  # Default configuration
├── staging/               # Staging-specific config
│   ├── AndroidManifest.xml
│   └── google-services.json
└── production/            # Production-specific config
    ├── AndroidManifest.xml
    └── google-services.json

ios/flavors/
├── staging/
│   └── GoogleService-Info.plist
└── production/
    └── GoogleService-Info.plist
```

## 🚀 Build & Deployment

Use the automated build script for easy deployment:

```bash
./build_deployment.sh
```

The script will:
1. Automatically increment version numbers
2. Prompt for build flavor (production/staging)
3. Prompt for platform (android/ios/both)
4. Execute the appropriate build commands

### Manual Build Commands

```bash
# Android App Bundle
flutter build appbundle --flavor production --target lib/main_prod.dart

# iOS App
flutter build ipa --flavor production --target lib/main_prod.dart

# Debug Build
flutter run --flavor staging --target lib/main_stag.dart
```

## 🌍 Internationalization

### Supported Languages
- **English** (en_US) - Default
- **German** (de_DE)
- **Polish** (pl_PL)

### Adding New Languages
1. Create new `.arb` file in `lib/l10n/` (e.g., `app_fr.arb`)
2. Add translations for all keys
3. Run code generation:
   ```bash
   flutter gen-l10n
   ```
4. Update `supportedLanguages` in `lib/features/locale/src/app_locale.dart`

### Usage in Code
```dart
// Access translations
final localizations = AppLocale.of(context).translate;
Text(localizations.welcome)
```

## 🏛️ Architecture Overview

### State Management
- **BLoC Pattern** for predictable state management
- **Repository Pattern** for data access layer
- **Provider Pattern** for dependency injection

### Key BLoCs
- `AuthenticationBloc` - Manages authentication state
- `UserBloc` - Handles user data and preferences
- `ConnectivityBloc` - Monitors network connectivity
- `NotificationBloc` - Manages push notifications
- `ContentBloc` - Handles dynamic content
- `AppLocaleBloc` - Manages language preferences

### Data Flow
```
UI ↔ BLoC ↔ Repository ↔ Provider ↔ API/Storage
```

## 🔧 Configuration

### App Configuration
Update `lib/utils/app_config.dart`:
```dart
class AppConfig {
  static const String appName = 'Your App Name';
  // Add other configuration constants
}
```

### Theme Configuration
Customize themes in `lib/utils/theme_config.dart`:
- Primary colors
- Typography
- Component themes
- Dark/light mode support

### API Configuration
Configure API endpoints in your custom packages or environment-specific files.

## 📱 Platform-Specific Setup

### Android
- Minimum SDK: 21
- Target SDK: 34
- Supports: Phone, Tablet

### iOS
- Minimum version: iOS 12.0
- Supports: iPhone, iPad

### Web
- Responsive design
- PWA capabilities

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Integration tests
flutter drive --target=test_driver/app.dart
```

## 📋 Scripts

### Available Scripts
- `build_deployment.sh` - Automated build and deployment
- `init_firebase.sh` - Firebase configuration setup

### Make Scripts Executable
```bash
chmod +x build_deployment.sh
chmod +x init_firebase.sh
```

## 🔐 Security

### Security Features
- Secure storage for sensitive data
- Certificate pinning (configurable)
- Biometric authentication support
- Secure API communication

### Best Practices
- Environment-specific configurations
- Secure key management
- Code obfuscation for release builds

## 📝 Code Quality

### Linting
- Uses `flutter_lints` for code analysis
- Custom rules in `analysis_options.yaml`
- Enforces consistent code style

### Code Generation
- JSON serialization with `json_annotation`
- Automatic model generation
- Localization code generation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Commit changes: `git commit -am 'Add new feature'`
4. Push to branch: `git push origin feature/new-feature`
5. Submit a pull request

### Development Guidelines
- Follow BLoC pattern for state management
- Use repository pattern for data access
- Maintain consistent code style
- Write unit tests for new features
- Update documentation

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check existing documentation
- Review Flutter official documentation

---

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Pattern Guide](https://bloclibrary.dev)
- [Firebase Flutter Setup](https://firebase.flutter.dev)
- [Flutter Localization](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

**Happy Coding! 🚀**
