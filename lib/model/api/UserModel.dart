import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_string/json_string.dart';
import 'package:smolathon_mobile/model/RequestMaker.dart';
import 'package:smolathon_mobile/model/RequestMethods.dart';
import 'package:smolathon_mobile/model/api/Model.dart';

class User extends MainModel {
  late String username;
  String? email;
  String? password;
  String? role;
  int? count;
  int? level;
  String? image;

  User({
    required this.username,
    this.email,
    this.password,
    this.role,
    this.count,
    this.level,
    this.image,
  });

  static User fromJson(String jsn) {
    Map<String, dynamic> jsonString = JsonString(jsn).decodedValueAsMap;
    return User(
        username: jsonString["username"],
        password: jsonString["password"],
        role: jsonString["role"],
        email: jsonString["email"],
        count: jsonString["count"],
        level: jsonString["level"],
        image: jsonString["image"]);
  }

  @override
  Object toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "role": role,
      "image": image,
      "level": level,
    };
  }

  static Future<User> getByUsername(String username) async {
    return fromJson(await RequestMaker.request(
        url: "user/$username", method: HTTP_METHOD.GET));
  }

  static Future<bool> login(
      {required String username, required String password}) async {
    return await RequestMaker.requestStatusCode(
            url: "user/login",
            method: HTTP_METHOD.POST,
            body: {
              "username": username,
              "password": password,
            }) ==
        200;
  }

  static Future<User> create(
      {required String username,
      required String email,
      required String password,
      required String role,
      required String level,
      required String image
      }) async {
    return fromJson(
      await RequestMaker.request(
        url: "user",
        method: HTTP_METHOD.POST,
        body: {
          "username": username,
          "email": email,
          "password": password,
          "role": role,
          "image": image,
          "level": level
        },
      ),
    );
  }
}
