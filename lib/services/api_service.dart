import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  
  // Get all tasks
  static Future<List<Task>> getTasks() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Task.fromJson({
          'id': json['id'].toString(),
          'title': json['title'],
          'description': json['body'],
          'createdAt': DateTime.now().toIso8601String(),
          'status': 'pending',
        })).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Error fetching tasks: $e');
    }
  }

  // Get task by ID
  static Future<Task> getTaskById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Task.fromJson({
          'id': data['id'].toString(),
          'title': data['title'],
          'description': data['body'],
          'createdAt': DateTime.now().toIso8601String(),
          'status': 'pending',
        });
      } else {
        throw Exception('Failed to load task');
      }
    } catch (e) {
      throw Exception('Error fetching task: $e');
    }
  }

  // Create new task
  static Future<Task> createTask(Task task) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': task.title,
          'body': task.description,
          'userId': 1,
        }),
      );
      
      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Task.fromJson({
          'id': data['id'].toString(),
          'title': data['title'],
          'description': data['body'],
          'createdAt': DateTime.now().toIso8601String(),
          'status': 'pending',
        });
      } else {
        throw Exception('Failed to create task');
      }
    } catch (e) {
      throw Exception('Error creating task: $e');
    }
  }

  // Update task
  static Future<Task> updateTask(Task task) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/${task.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': task.id,
          'title': task.title,
          'body': task.description,
          'userId': 1,
        }),
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Task.fromJson({
          'id': data['id'].toString(),
          'title': data['title'],
          'description': data['body'],
          'createdAt': task.createdAt.toIso8601String(),
          'status': task.status.toString().split('.').last,
        });
      } else {
        throw Exception('Failed to update task');
      }
    } catch (e) {
      throw Exception('Error updating task: $e');
    }
  }

  // Delete task
  static Future<bool> deleteTask(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error deleting task: $e');
    }
  }
}
