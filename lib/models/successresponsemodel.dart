class SuccessResponse {
  final String status;
  final String message;
  final UserData data;
  final Tokens tokens;

  SuccessResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.tokens,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return SuccessResponse(
      status: json['Status'],
      message: json['Msg'],
      data: UserData.fromJson(json['data']),
      tokens: Tokens.fromJson(json['tokens']),
    );
  }
}

class UserData {
  final int id;
  final String name;
  final int phone;
  final String place;
  final int pincode;
  final String email;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.place,
    required this.pincode,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      place: json['place'],
      pincode: json['pincode'],
      email: json['email'],
    );
  }
}

class Tokens {
  final String access;
  final String refresh;

  Tokens({
    required this.access,
    required this.refresh,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json['access'],
      refresh: json['refresh'],
    );
  }
}
