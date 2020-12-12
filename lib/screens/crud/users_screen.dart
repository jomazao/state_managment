import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/screens/crud/all_users_screen.dart';
import 'package:state_managment/screens/crud/users_screen_bloc.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersScreenBloc(),
      child: Builder(builder: (context) {
        final bloc = context.watch<UsersScreenBloc>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: bloc.createUser,
              ),
              FloatingActionButton(
                heroTag: 'all',
                backgroundColor: Colors.orange,
                child: Icon(Icons.sort),
                onPressed: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllUsersScreen()));
                },
              ),
            ],
          ),
          body: Column(children: [
            TextField(
              controller: bloc.nameController,
              decoration: InputDecoration(
                hintText: 'Digite su nombre',
                errorText: bloc.errors['name'],
              ),
            ),
            TextField(
              controller: bloc.lastNameController,
              decoration: InputDecoration(
                hintText: 'Digite su apellido',
                errorText: bloc.errors['lastName'],
              ),
            ),
            TextField(
              controller: bloc.documentController,
              decoration: InputDecoration(
                hintText: 'Digite su documento',
                errorText: bloc.errors['document'],
              ),
            ),
            if (bloc.isLoading)
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(),
              )
          ]),
        );
      }),
    );
  }
}
