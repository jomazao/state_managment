import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  var position = -50.0;
  var size = 10.0;
  @override
  Widget build(BuildContext context) {
    final sq = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          color: Colors.orange),
    );
    final sq2 = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          color: Colors.green),
    );

    final sq3 = Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          color: Colors.green),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(0.0),
              alignment: FractionalOffset.center,
              child: Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 5,
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      AnimatedPositioned(
                        child: sq2,
                        duration: Duration(seconds: 5),
                        left: position,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 5),
                          width: 100,
                          height: 100,
                          transform: size == 10
                              ? (Matrix4.identity()
                                ..setEntry(3, 2, 0.01)
                                ..rotateX(0.6))
                              : Matrix4.identity()
                            ..setEntry(3, 2, 0.01)
                            ..rotateX(0),
                          alignment: FractionalOffset.center,
                          child: Container(
                            color: Colors.blue,
                            child: Text('12345678901234567890'),
                          ),
                        ),
                      ),
                      Align(
                        child: AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          transitionBuilder: (child, animation) =>
                              RotationTransition(
                            turns: animation,
                            child: child,
                          ),
                          child: size == 10
                              ? Container(
                                  key: ValueKey(1),
                                  height: 30,
                                  width: 30,
                                  color: Colors.pink,
                                )
                              : Container(
                                  key: ValueKey(2),
                                  height: 100,
                                  width: 100,
                                  color: Colors.yellow,
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  position = -80;
                  size = 10;
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  position = 30;
                  size = 70;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
