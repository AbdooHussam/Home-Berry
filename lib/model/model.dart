// To parse this JSON data, do
//
//     final homeBerry = homeBerryFromJson(jsonString);

import 'dart:convert';

HomeBerry homeBerryFromJson(String str) => HomeBerry.fromJson(json.decode(str));

String homeBerryToJson(HomeBerry data) => json.encode(data.toJson());

class HomeBerry {
  HomeBerry({
    this.status,
    this.message,
    this.isUserFound,
    this.data,
  });

  int status;
  String message;
  bool isUserFound;
  Data data;

  factory HomeBerry.fromJson(Map<String, dynamic> json) => HomeBerry(
    status: json["status"],
    message: json["message"],
    isUserFound: json["is_user_found"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "is_user_found": isUserFound,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.lastName,
    this.mobile,
    this.email,
    this.type,
    this.countryCode,
    this.createdAt,
    this.verified,
    this.tokenType,
    this.accessToken,
    this.expiresAt,
  });

  int id;
  String name;
  String lastName;
  String mobile;
  String email;
  String type;
  String countryCode;
  String createdAt;
  bool verified;
  String tokenType;
  String accessToken;
  DateTime expiresAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    email: json["email"],
    type: json["type"],
    countryCode: json["country_code"],
    createdAt: json["created_at"],
    verified: json["verified"],
    tokenType: json["token_type"],
    accessToken: json["access_token"],
    expiresAt: DateTime.parse(json["expires_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "last_name": lastName,
    "mobile": mobile,
    "email": email,
    "type": type,
    "country_code": countryCode,
    "created_at": createdAt,
    "verified": verified,
    "token_type": tokenType,
    "access_token": accessToken,
    "expires_at": expiresAt.toIso8601String(),
  };
}
