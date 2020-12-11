import 'package:flutter/material.dart';

class UsersScreenBloc extends ChangeNotifier {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final documentController = TextEditingController();
  Map<String, String> errors = {};
  void createUser() {
    if (validateInputs()) {
      //Create user
    } else {
      //Show Errors
    }

    notifyListeners();
  }

  bool validateInputs() {
    var hasError = true;
    errors.clear();
    if (nameController.text.isEmpty) {
      errors.putIfAbsent('name', () => 'Name cant be empty');
      hasError = false;
    }
    if (lastNameController.text.isEmpty) {
      errors.putIfAbsent('lastName', () => 'LastName cant be empty');
      hasError = false;
    }
    if (documentController.text.isEmpty) {
      errors.putIfAbsent('document', () => 'Document cant be empty');
      hasError = false;
    }

    return hasError;
  }
}
