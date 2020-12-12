import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_managment/data/repositories/user_repository.dart';
import 'package:state_managment/models/user.dart';

class AllUsersScreenBloc extends ChangeNotifier {
  final _userRepository = UserRepository();

  var users = <User>[];
  User userSelected;

  StreamSubscription usersStreamSubscription;

  AllUsersScreenBloc() {
    usersStreamSubscription =
        _userRepository.usersStream().listen((actualUsers) {
      users = actualUsers;
      notifyListeners();
    });
  }

  void selectUser(User user) {
    if (user == userSelected) {
      userSelected = null;
    } else {
      userSelected = user;
    }

    notifyListeners();
  }

  void searchById(String documentId) async {
    final user = await _userRepository.getById(documentId).first;
    user.name;
    user.lastName;
  }

  void deleteSelected() {
    _userRepository.delete(userSelected);
    userSelected = null;
  }

  @override
  void dispose() {
    usersStreamSubscription.cancel();
    super.dispose();
  }
}
