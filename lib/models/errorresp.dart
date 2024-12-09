class ErrorResponse {
  final String status;
  final String message;
  final Map<String, List<String>> errors;

  ErrorResponse({
    required this.status,
    required this.message,
    required this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['Status'],
      message: json['Msg'],
      errors: Map<String, List<String>>.from(json['Errors'].map((key, value) =>
          MapEntry(key, List<String>.from(value)))),
    );
  }
}
