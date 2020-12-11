import 'package:flutter/material.dart';

class RegisterScreenModel extends ChangeNotifier {
  final registered = <String>[];
  void register(String name) {
    registered.add(name);
    notifyListeners();
  }
}
