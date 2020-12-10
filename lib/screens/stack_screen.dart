import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sq = Container(
      width: 50,
      height: 50,
      color: Colors.orange,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(children: []),
        ),
      ),
    );
  }
}
