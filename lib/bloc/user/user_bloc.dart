import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_user_bloc/bloc/bloc.dart';
import 'package:manage_user_bloc/repositories/repositories.dart';

import '../../models/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is GetUserEvent) {
      yield* _mapUserToState(event);
    }
  }

  Stream<UserState> _mapUserToState(UserEvent event) async* {
    yield UserLoadingState();
    debugPrint("UserEvent -> Loading");

    try {
      List<User> listUsers = await userRepository.getUsers();
      debugPrint("UserEvent -> Loaded");
      yield UserLoadedState(listUser: listUsers);
    } catch (error) {
      debugPrint("UserEvent -> Error: ${error.toString()}");
      yield UserErrorState(error: error.toString());
    }
  }
}
