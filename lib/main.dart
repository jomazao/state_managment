import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:state_managment/screens/crud/users_screen.dart';
import 'package:state_managment/screens/register_screen_model.dart';
import 'package:state_managment/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: DarkTheme().themeData,
              home: MyHomePage(),
            );
          }
          // Otherwise, show something whilst waiting for initialization to complete
          return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

class MyHomePage extends StatelessWidget {
  final registerModel = RegisterScreenModel();
  @override
  Widget build(BuildContext context) {
    return UsersScreen();
  }
}
