import 'package:manage_user_bloc/models/user.dart';
import 'package:manage_user_bloc/services/services.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    return await UserService().getUsers();
  }
}
