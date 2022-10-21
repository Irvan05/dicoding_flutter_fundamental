import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  static const routeName = '/ui_design/implicit_animation';

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _isBig = false;
  double _size = 100.0;
  Color _boxColor = Colors.blue;

  Tween<double> _animationTween = Tween(begin: 0, end: pi * 2);
  // final Tween _colorTween =
  //     ColorTween(begin: Colors.blue, end: Colors.purple) as Tween<Color>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              color: _boxColor,
              height: _size,
              width: _size,
            ),
            TweenAnimationBuilder<double>(
              tween: _animationTween,
              duration: Duration(seconds: 3),
              builder: (context, double value, child) {
                return Transform.rotate(
                  angle: value,
                  child: Container(
                    color: Colors.blue,
                    height: _size,
                    width: _size,
                  ),
                );
              },
            ),
            // TweenAnimationBuilder<Color>(
            //   tween: ColorTween(begin: Colors.blue, end: Colors.purple)
            //       as Tween<Color>,
            //   duration: Duration(seconds: 3),
            //   builder: (context, Color value, child) {
            //     return Container(
            //       color: value,
            //       height: _size,
            //       width: _size,
            //     );
            //   },
            // ),
            ElevatedButton(
              child: Text('Animate'),
              onPressed: () {
                setState(() {
                  _size = _isBig ? 200 : 100;
                  _isBig = !_isBig;
                  _boxColor =
                      _boxColor == Colors.blue ? Colors.amber : Colors.blue;
                  _animationTween = _animationTween;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
