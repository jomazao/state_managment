import 'package:flutter/material.dart';
import 'package:state_managment/data/repositories/user_repository.dart';
import 'package:state_managment/models/user.dart';

class UsersScreenBloc extends ChangeNotifier {
  final _userRepository = UserRepository();

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final documentController = TextEditingController();
  Map<String, String> errors = {};
  bool isLoading = false;

  void createUser() async {
    if (validateInputs()) {
      final user = User(
        name: nameController.text,
        lastName: lastNameController.text,
        document: documentController.text,
      );

      //Create user
      isLoading = true;
      notifyListeners();
      await _userRepository.create(user);
      isLoading = false;
    } else {
      //Show Errors
    }

    notifyListeners();
  }

  bool validateInputs() {
    var valid = true;
    errors.clear();
    if (nameController.text.isEmpty) {
      errors.putIfAbsent('name', () => 'Name cant be empty');
      valid = false;
    }
    if (lastNameController.text.isEmpty) {
      errors.putIfAbsent('lastName', () => 'LastName cant be empty');
      valid = false;
    }
    if (documentController.text.isEmpty) {
      errors.putIfAbsent('document', () => 'Document cant be empty');
      valid = false;
    }

    return valid;
  }
}
