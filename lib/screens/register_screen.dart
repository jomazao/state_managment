import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/screens/register_screen_model.dart';
import 'package:state_managment/widgets/title_text.dart';

class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenModel = context.watch<RegisterScreenModel>();

    String name = null;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: screenModel.registered
                  .map((name) => TitleText.subTitle(name))
                  .toList(),
            ),
          ),
          Row(children: [
            Expanded(
                child: TextField(
              controller: _nameController,
            )),
            RaisedButton(
              onPressed: () {
                final name = _nameController.text;
                screenModel.register(name);
              },
              child: Text(name.defaultText(text: 'NO HAY DATA')),
            )
          ])
        ],
      ),
    );
  }
}

extension on int {
  int sumarleDiez() {
    return this + 10;
  }
}

extension on String {
  String defaultText({String text}) {
    if (this == null) {
      return text ?? 'EMPTY DATA';
    }
    if (this.isEmpty) {
      return text ?? 'EMPTY DATA';
    }

    return this;
  }

  String helloWorld() {
    return 'HELLO WORLD';
  }

  String toSentenceCase() {}
}
