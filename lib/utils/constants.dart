class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String postsEndpoint = '/posts';
  
  // App Configuration
  static const String appName = 'Task Manager';
  static const String appVersion = '1.0.0';
  
  // Task Categories
  static const List<String> taskCategories = [
    'Study',
    'Assignment',
    'Project',
    'Exam',
    'Research',
    'Other',
  ];
  
  // Status Colors
  static const Map<String, int> statusColors = {
    'pending': 0xFFFF9800,    // Orange
    'inProgress': 0xFF2196F3,  // Blue
    'completed': 0xFF4CAF50,   // Green
    'cancelled': 0xFFF44336,    // Red
  };
  
  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
}
