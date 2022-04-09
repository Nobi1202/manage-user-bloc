import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_user_bloc/bloc/bloc.dart';
import 'package:manage_user_bloc/models/user.dart';

import '../../utils/utility.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<User> _listUsers = [];

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoadingState) {
            LoadingHelper.showLoading(context);
          } else if (state is UserLoadedState) {
            LoadingHelper.hideLoading(context);
          } else if (state is UserErrorState) {
            LoadingHelper.hideLoading(context);
            DialogHelper.showAlertDialog(
              context: context,
              message: state.error,
              title: "Error",
            );
          }
        },
        buildWhen: (context, state) {
          return state is UserLoadingState || state is UserLoadedState;
        },
        builder: (context, state) {
          if (state is UserLoadedState) {
            _listUsers = state.listUser;
            return SafeArea(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _listUsers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 30),
                                height: 60,
                                width: 60,
                                child: ClipOval(
                                  child: Image.network(
                                    _listUsers[index].urlAvatar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _listUsers[index].userName,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      _listUsers[index].email,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return const Center(
            child: Text("Error State"),
          );
        },
      ),
    );
  }
}
