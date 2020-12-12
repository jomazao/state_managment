import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/screens/crud/all_users_screen_bloc.dart';
import 'package:state_managment/widgets/title_text.dart';

class AllUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AllUsersScreenBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.watch<AllUsersScreenBloc>();
          final users = bloc.users;

          return Scaffold(
            floatingActionButton: bloc.userSelected != null
                ? FloatingActionButton(
                    onPressed: bloc.deleteSelected,
                    child: Icon(Icons.delete),
                  )
                : null,
            body: ListView(
              children: users
                  .map(
                    (user) => GestureDetector(
                      onLongPress: () => bloc.selectUser(user),
                      child: ColoredBox(
                          color: user == bloc.userSelected
                              ? Colors.green
                              : Colors.white,
                          child: TitleText.subTitle(user.fullName)),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
