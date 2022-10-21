import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  static const routeName = '/ui_design/gesture_detector';
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  double posX = 0.0;
  double posY = 0.0;

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: posY,
              left: posX,
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    double deltaX = details.delta.dx;
                    double deltaY = details.delta.dy;
                    posX += deltaX;
                    posY += deltaY;
                  });
                },
                // onVerticalDragUpdate dan onHorizontalDragUpdate hanya untuk 1 gerakan
                // onVerticalDragUpdate: (DragUpdateDetails details) {
                //   setState(() {
                //     double delta = details.delta.dy;
                //     posY += delta;
                //   });
                // },
                // onHorizontalDragUpdate: (DragUpdateDetails details) {
                //   setState(() {
                //     double delta = details.delta.dx;
                //     posX += delta;
                //   });
                // },
                onTap: () {
                  setState(() {
                    numTaps++;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    numDoubleTaps++;
                  });
                },
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: 0',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
