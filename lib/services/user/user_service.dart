import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manage_user_bloc/models/user.dart';

class UserService {
  Future<List<User>> getUsers() async {
    var url =
        "https://raw.githubusercontent.com/JohannesMilke/futurebuilder_example/master/assets/users.json";

    List<User> listUser = [];

    var response = await http.get(Uri.parse(url));
    debugPrint("getUsers -> url: $url");

    if (response.statusCode == HttpStatus.ok) {
      Iterable data = jsonDecode(response.body);
      listUser = List<User>.from(
        data.map((e) => User.fromJson(e)),
      );
    }
    return listUser;
  }
}
