// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

AuthModel loginModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String loginModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final String? siteName;
  final String? organizationName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final bool? emailConfirmed;
  final bool? phoneNumberConfirmed;
  final bool? isPasswordChanged;
  final String? roleName;
  final String? userName;
  final String? token;
  final String? organizationId;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final String? siteId;
  final DateTime? createdDate;

  AuthModel({
    this.siteName,
    this.organizationName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.emailConfirmed,
    this.phoneNumberConfirmed,
    this.isPasswordChanged,
    this.roleName,
    this.userName,
    this.token,
    this.organizationId,
    this.id,
    this.isActive,
    this.isDeleted,
    this.siteId,
    this.createdDate,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        siteName: json["siteName"],
        organizationName: json["organizationName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        emailConfirmed: json["emailConfirmed"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
        isPasswordChanged: json["isPasswordChanged"],
        roleName: json["roleName"],
        userName: json["userName"],
        token: json["token"],
        organizationId: json["organizationId"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        siteId: json["siteId"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "siteName": siteName,
        "organizationName": organizationName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "emailConfirmed": emailConfirmed,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "isPasswordChanged": isPasswordChanged,
        "roleName": roleName,
        "userName": userName,
        "token": token,
        "organizationId": organizationId,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "siteId": siteId,
        "createdDate": createdDate?.toIso8601String(),
      };
}
