import 'dart:convert';

class AuthDTO {
  final String email;
  final String password;

  AuthDTO(this.email, this.password);

  factory AuthDTO.fromRequest(String body) {
    var map = jsonDecode(body);
    return AuthDTO(
      map['email'],
      map['password'].toString(),
    );
  }
}
