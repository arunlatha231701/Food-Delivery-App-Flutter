import 'package:meta/meta.dart';
import 'dart:convert';

 class UserDetails {
   final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserDetails({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserDetails.fromRawJson(String str) => UserDetails.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromRawJson(String str) => Support.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
