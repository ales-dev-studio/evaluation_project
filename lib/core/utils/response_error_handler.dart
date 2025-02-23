/// Api request's response error handler
String responseErrorHandler({final dynamic error}) {
  try {
    if (error == null) {
      return 'An error has occurred';
    }

    /// Checks for common dio network connections error messages
    if (error.toString().contains('SocketException') ||
        error.toString().contains('TypeError') ||
        error.toString().contains('HttpException') ||
        error.toString().contains('connectTimeout') ||
        error.toString().contains('Connection') ||
        error.toString().contains('timeout')) {
      return 'Error connecting to the server';
    }

    return 'An error has occurred';
  } catch (e) {
    return 'An error has occurred';
  }
}
