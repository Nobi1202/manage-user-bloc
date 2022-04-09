import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:manage_user_bloc/models/user.dart';

class UserService {
  Future<List<User>> getUsers() async {
    var url =
        "https://raw.githubusercontent.com/JohannesMilke/futurebuilder_example/master/assets/users.json";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      print(response.body);
      return List.from(
        data.map((e) => User.fromJson(e)),
      );
    }
    return [];
  }
}
