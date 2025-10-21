# Task Manager - Educational Task Management App

A comprehensive Flutter application for managing educational tasks with a beautiful UI and full API integration.

## Features

### 🎯 Core Functionality
- **Task Management**: Create, read, update, and delete tasks
- **Status Tracking**: Pending, In Progress, Completed, Cancelled
- **Categories**: Study, Assignment, Project, Exam, Research, Other
- **Due Dates**: Set and track task deadlines
- **Search & Filter**: Filter tasks by status

### 🎨 User Interface
- **Splash Screen**: Education-themed logo with book and pen icons
- **Modern Design**: Material Design 3 with custom theming
- **Responsive Layout**: Works on all screen sizes
- **Smooth Animations**: Engaging user experience
- **Tab Navigation**: Easy task organization

### 🔌 API Integration
- **RESTful API**: Full CRUD operations with JSONPlaceholder API
- **Error Handling**: Comprehensive error management
- **Loading States**: User-friendly loading indicators
- **Offline Support**: Local state management with Provider

### 📱 Screens
1. **Splash Screen**: Education-themed welcome screen
2. **Home Screen**: Task list with tabbed navigation
3. **Add Task Screen**: Create new tasks with full details
4. **Task Detail Screen**: View and edit task information

## Technical Implementation

### Architecture
- **State Management**: Provider pattern for reactive state
- **API Service**: Centralized HTTP client with error handling
- **Model Classes**: Type-safe data models
- **Widget Composition**: Reusable custom widgets

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  http: ^1.1.0
  provider: ^6.1.1
  shared_preferences: ^2.2.2
  intl: ^0.19.0
```

### Project Structure
```
lib/
├── models/
│   └── task.dart              # Task data model
├── providers/
│   └── task_provider.dart     # State management
├── services/
│   └── api_service.dart       # API integration
├── screens/
│   ├── splash_screen.dart     # Welcome screen
│   ├── home_screen.dart       # Main task list
│   ├── add_task_screen.dart   # Create task
│   └── task_detail_screen.dart # Task details
├── widgets/
│   ├── custom_app_bar.dart    # Reusable app bar
│   ├── loading_widget.dart    # Loading indicator
│   └── error_widget.dart      # Error display
├── utils/
│   └── constants.dart          # App constants
└── main.dart                  # App entry point
```

## API Endpoints

The app integrates with JSONPlaceholder API:

- **GET** `/posts` - Fetch all tasks
- **GET** `/posts/{id}` - Fetch specific task
- **POST** `/posts` - Create new task
- **PUT** `/posts/{id}` - Update task
- **DELETE** `/posts/{id}` - Delete task

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd task_manager
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## Usage

### Creating Tasks
1. Tap the floating action button (+)
2. Fill in task details (title, description, category, due date)
3. Select task status
4. Tap "Save Task"

### Managing Tasks
- **View**: Tap any task to see details
- **Edit**: Use the edit button in task details
- **Delete**: Use the delete option in task menu
- **Status**: Toggle between pending/completed

### Navigation
- **All Tasks**: View all tasks
- **Pending**: View incomplete tasks
- **Completed**: View finished tasks

## Customization

### Themes
The app uses a blue color scheme that can be customized in `main.dart`:

```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.light,
),
```

### Categories
Add new task categories in `lib/utils/constants.dart`:

```dart
static const List<String> taskCategories = [
  'Study',
  'Assignment',
  'Project',
  'Exam',
  'Research',
  'Other',
  'Your Category', // Add here
];
```

## Error Handling

The app includes comprehensive error handling:
- Network connectivity issues
- API response errors
- Form validation
- User-friendly error messages

## Performance

- **Lazy Loading**: Tasks loaded on demand
- **State Management**: Efficient Provider pattern
- **Memory Management**: Proper widget disposal
- **Smooth Animations**: 60fps performance

## Future Enhancements

- [ ] User authentication
- [ ] Cloud synchronization
- [ ] Push notifications
- [ ] Task templates
- [ ] Progress analytics
- [ ] Dark mode support
- [ ] Multi-language support

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation

---

**Task Manager** - Empowering education through organized task management! 📚✏️
