import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/screens/crud/users_screen_bloc.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersScreenBloc(),
      child: Builder(builder: (context) {
        final bloc = context.watch<UsersScreenBloc>();
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: bloc.createUser,
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
