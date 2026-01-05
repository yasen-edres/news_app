# News App

<p align="center">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Splash.png?raw=true" width="250">
</p>

<p align="center">
  <b>A modern news application with real-time updates and elegant UI</b>
</p>

---

## About The App

A comprehensive news application developed using Flutter, delivering the latest news from various categories through REST API integration. This project marks my first complete experience with API consumption, where I implemented asynchronous programming using multiple networking packages (HTTP, Dio, and Retrofit). The app features a responsive design with light and dark theme support, efficient state management with Cubit, and a fully responsive UI that handles all application states to enhance user experience. Built on Clean Architecture principles to ensure code quality and maintainability.

---

## Main Features

### News Categories
- Browse news by multiple categories (Sports, Technology, Business, Entertainment, etc.)
- Category-specific news feeds
- Easy navigation between categories
- Custom category filtering

### Real-Time News Updates
- Fetch latest news articles via REST API
- Automatic content refresh
- Real-time news synchronization
- Detailed article information

### Advanced Search
- Search news articles by keywords
- Filter search results
- Quick and efficient search functionality
- Search history support

### Theme Support
- Light and Dark theme modes
- Smooth theme switching
- Persistent theme preferences
- Eye-friendly color schemes

### Article Reader
- In-app web view for full articles
- Smooth article loading
- Share articles functionality
- Bookmark favorite articles

### Responsive UI
- Adaptive design for all screen sizes
- Smooth animations and transitions
- User-friendly navigation drawer
- Optimized performance

### State Management
- Efficient state handling with Cubit
- Loading states management
- Error handling and retry mechanisms
- Smooth data flow

---

## App Screenshots

### Splash & Home Screens
<p align="center">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Splash.png?raw=true" width="200">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Home.png?raw=true" width="200">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Home2.png?raw=true" width="200">
</p>

### Categories & Navigation
<p align="center">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Home3.png?raw=true" width="200">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Home4.png?raw=true" width="200">
</p>

### Search & Article View
<p align="center">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Search.png?raw=true" width="200">
  <img src="https://github.com/yasen-edres/news_app/blob/master/Home5.png?raw=true" width="200">
</p>

---

## Technologies Used

### Frontend Framework
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

### State Management
- **Flutter Bloc (Cubit)** - For efficient state management and business logic separation
- **Responsive UI for All States** - Loading, Success, Error, and Empty states with proper UI feedback

### Networking
- **HTTP** - Basic HTTP requests
- **Dio** - Advanced HTTP client with interceptors
- **Retrofit** - Type-safe REST client
- **News API** - For fetching real-time news data
- **Asynchronous Programming** - Future, async/await patterns

### Theme Management
- **Provider** - For theme state management
- **Shared Preferences** - For theme persistence

### UI Components
- **WebView** - For displaying full articles
- **Custom Widgets** - For reusable UI components

### Architecture
- **Clean Architecture** - Separation of concerns and maintainability
- **BLoC Pattern (Cubit)** - For state management
- **Repository Pattern** - For data abstraction

---

## Installation & Setup

### Prerequisites
- Flutter SDK (version 3.0 or higher)
- Dart SDK
- Android Studio or VS Code
- Android/iOS device or emulator
- News API Key (Get it from [newsapi.org](https://newsapi.org))

### Installation Steps

1. **Clone the repository**
```bash
git clone https://github.com/yasen-edres/news_app.git
```

2. **Navigate to project directory**
```bash
cd news_app
```

3. **Install dependencies**
```bash
flutter pub get
```

4. **Add your API Key**
- Open the API configuration file
- Add your News API key

5. **Run the app**
```bash
flutter run
```

---

## Project Structure

```
news_app/
├── lib/
│   ├── api/                        # API Layer
│   │   └── [API configuration & endpoints]
│   ├── home/                       # Main app screens
│   │   ├── category_details/      # Category details screen
│   │   │   ├── cubit/             # State management for category
│   │   │   └── widget/            # Category-specific widgets
│   │   ├── category_fragment/     # Categories list view
│   │   ├── drawer/                # Navigation drawer
│   │   │   └── widget/            # Drawer widgets
│   │   ├── news/                  # News feed screen
│   │   │   └── cubit/             # News state management
│   │   ├── search/                # Search functionality
│   │   │   └── widget/            # Search widgets
│   │   └── webview/               # Article web view
│   ├── model/                     # Data models
│   ├── provider/                  # Provider for theme management
│   └── utils/                     # Utility functions & constants
└── pubspec.yaml                   # Dependencies file
```

---

## Clean Architecture Implementation

### Presentation Layer
- **UI Screens** - Home, Categories, Search, Article View
- **Widgets** - Reusable UI components
- **Cubit** - State management for each feature
- **Provider** - Theme management

### Domain Layer
- **Models** - Business entities
- **Use Cases** - Application business logic

### Data Layer
- **API** - REST API integration
- **Repositories** - Data source abstraction
- **Utils** - Helper functions and constants

---

## Key Features Implementation

### Theme Switching
```dart
// Light and Dark theme support with Provider
- Persistent theme selection
- Smooth theme transitions
- Custom color schemes for both themes
```

### State Management
```dart
// Using Cubit for efficient state handling
- Loading states
- Success states
- Error states with retry
- Empty states handling
```

### API Integration
```dart
// REST API calls for news data
- Category-based news fetching
- Search functionality
- Error handling and retries
- Response caching
```

---

## Learning Objectives

This app was developed as my first complete project working with REST APIs, focusing on:
- **API Consumption** - First experience with complete API integration
- **Multiple HTTP Packages** - Implemented using HTTP, Dio, and Retrofit
- **Asynchronous Programming** - Mastering Future, async/await, and Stream
- **Clean Architecture principles**
- **BLoC/Cubit state management pattern**
- **Comprehensive State Handling** - Building responsive UI for all states (Loading, Success, Error, Empty)
- **Theme management with Provider**
- **WebView implementation**
- **Responsive UI design**
- **Error handling strategies**
- **Search functionality implementation**
- **Navigation patterns in Flutter**
- **User Experience Enhancement** - Proper feedback for all user interactions

---

## API Reference

This app uses the [News API](https://newsapi.org) to fetch real-time news data.

**Endpoints used:**
- `/top-headlines` - Get top headlines
- `/everything` - Search news articles
- Category filtering by source

---

## Developer

**Yasen Edres**

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/yasen-edres)

---

## License

This project is open source and available for educational and commercial use.

---

## Contributing

Contributions are welcome! If you have suggestions to improve the app:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## Contact

For any inquiries, suggestions, or mobile development services:

**Email:** yassinehedres@gmail.com  
**Phone:** +20 1068792817  
**GitHub Issues:** For project-related questions

**Available for:**
- Mobile App Development (Flutter/Dart)
- News & Media Applications
- UI/UX Design Implementation
- App Maintenance & Updates
- Custom Mobile Solutions
- API Integration Services

---

<p align="center">
  Made with ❤️ using Flutter & Clean Architecture
</p>
