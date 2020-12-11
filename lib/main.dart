import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:state_managment/first_screen.dart';
import 'package:state_managment/model_state.dart';
import 'package:state_managment/model_state_cubit.dart';
import 'package:state_managment/screens/register_screen.dart';
import 'package:state_managment/screens/register_screen_model.dart';

import 'package:state_managment/styles/themes.dart';
import 'package:state_managment/widgets/title_text.dart';

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
  final registerModel = RegisterScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: registerModel,
        child: RegisterScreen(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('People registered'),
                    content: Column(
                      children: registerModel.registered
                          .map((e) => TitleText.subTitle(e))
                          .toList(),
                    ),
                  ));
        },
      ),
    );
  }
}
