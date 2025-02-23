import 'package:dio/dio.dart';
import 'package:evaluation_project/core/routes/apis_routes.dart'; // Import API routes

class DioSingleton {
  // Private constructor to prevent instantiation of this class
  DioSingleton._internal();

  // Static instance of Dio
  static Dio? _dio;

  // Method to get a singleton instance of Dio
  static Dio? getInstance() {
    // Initialize the Dio instance if it hasn't been initialized yet
    _dio ??= Dio(
      BaseOptions(
        baseUrl: Routes.baseUrl, // Base URL for API requests
        connectTimeout: const Duration(seconds: 20), // Connection timeout
        receiveTimeout: const Duration(seconds: 20), // Receive timeout
      ),
    );

    return _dio; // Return the singleton instance of Dio
  }
}