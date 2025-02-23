import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart' as dio_package;
import 'package:dio/dio.dart';
import 'package:evaluation_project/core/utils/dio_singleton.dart';
import 'package:flutter/foundation.dart';

// General API handler function for making HTTP requests
Future generalApi({
  required final String method, // HTTP method (e.g., GET, POST)
  required final String url, // API endpoint URL
  final data, // Request payload
  final Map<String, dynamic>? queryParam, // Query parameters
  final Map<String, dynamic>? header, // Request headers
  final responseTypeIsByte = false, // Whether the response type is bytes
  final ProgressCallback? onSendProgress, // Callback for upload progress
  // Whether to return response on error
  final bool returnResponseOnError = false,
}) async {
  Dio? dio;
  dio = DioSingleton.getInstance(); // Get the singleton instance of Dio

  // Set the HTTP method for the request
  dio!.options.method = method.toLowerCase();

  // Add custom headers if provided
  if (header != null) {
    dio.options.headers = header;
  }

  // Log request details in debug mode
  if (kDebugMode) {
    print('${method.toLowerCase()}: ${dio.options.baseUrl}$url');
    print(dio.options.headers);
    if (data != null) {
      log('Data sent: $data');
    }
  }

  try {
    // Make the HTTP request using Dio
    final dio_package.Response response = await dio.request(
      url,
      data: data, // Request payload
      queryParameters: queryParam, // Query parameters
      options: responseTypeIsByte
          ? Options(
              responseType:
                  ResponseType.bytes, // Set response type to bytes if needed
            )
          : null,
      onSendProgress: onSendProgress, // Upload progress callback
    );

    // Log response details in debug mode
    if (kDebugMode) {
      log('Status code: ${response.statusCode}');
      log('Data received: ${response.data}');
    }

    return response; // Return the response
  } catch (e) {
    // Handle Dio errors
    if (e is dio_package.DioException) {
      // Log error response in debug mode
      if (kDebugMode) {
        log(e.response.toString());
      }

      // If no response is received, rethrow the exception
      if (e.response == null) {
        rethrow;
      }

      // Return the error response if returnResponseOnError is true
      if (returnResponseOnError) {
        return e.response;
      }
    } else {
      // Rethrow any non-Dio exceptions
      rethrow;
    }
  }
}
