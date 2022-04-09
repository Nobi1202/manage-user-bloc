import 'package:equatable/equatable.dart';
import 'package:manage_user_bloc/models/user.dart';

class UserState extends Equatable {
  const UserState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> listUser;

  const UserLoadedState({required this.listUser});
}

class UserErrorState extends UserState {
  final String error;

  const UserErrorState({required this.error});
}
