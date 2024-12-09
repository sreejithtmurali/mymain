class LoginResponse {
  final String refresh;
  final String access;
  final int id;
  final String name;
  final String place;
  final String email;

  LoginResponse({
    required this.refresh,
    required this.access,
    required this.id,
    required this.name,
    required this.place,
    required this.email,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      refresh: json['refresh'],
      access: json['access'],
      id: json['id'],
      name: json['name'],
      place: json['place'],
      email: json['email'],
    );
  }
}
