import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = false;
  String? _error;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get all tasks
  Future<void> fetchTasks() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _tasks = await ApiService.getTasks();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add new task
  Future<void> addTask(Task task) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newTask = await ApiService.createTask(task);
      _tasks.add(newTask);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update task
  Future<void> updateTask(Task task) async {
    _isLoading = true;
    notifyListeners();

    try {
      final updatedTask = await ApiService.updateTask(task);
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = updatedTask;
      }
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete task
  Future<void> deleteTask(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final success = await ApiService.deleteTask(id);
      if (success) {
        _tasks.removeWhere((task) => task.id == id);
      }
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Toggle task status
  void toggleTaskStatus(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final task = _tasks[index];
      final newStatus = task.status == TaskStatus.completed 
          ? TaskStatus.pending 
          : TaskStatus.completed;
      
      _tasks[index] = task.copyWith(status: newStatus);
      notifyListeners();
    }
  }

  // Get tasks by status
  List<Task> getTasksByStatus(TaskStatus status) {
    return _tasks.where((task) => task.status == status).toList();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
