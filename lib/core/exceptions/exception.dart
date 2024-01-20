class APIException implements Exception {
  final String message;
  
  APIException({
    required this.message,
  });
}
