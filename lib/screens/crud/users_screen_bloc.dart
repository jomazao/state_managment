import 'package:flutter/material.dart';

class UsersScreenBloc extends ChangeNotifier {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final documentId = TextEditingController();

  void createUser() {
    notifyListeners();
  }
}
