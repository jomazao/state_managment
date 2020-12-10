import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/first_screen.dart';
import 'package:state_managment/model_state.dart';
import 'package:state_managment/model_state_cubit.dart';
import 'package:state_managment/screens/stack_screen.dart';
import 'package:state_managment/screens/trm_screen.dart';
import 'package:state_managment/screens/wallet-screen.dart';
import 'package:state_managment/second_screen.dart';
import 'package:state_managment/styles/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DarkTheme().themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelState1 = ModelState();
    return StackScreen();
  }
}
