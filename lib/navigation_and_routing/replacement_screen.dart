import 'package:flutter/material.dart';

class ReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Another Screen'),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/navigation_and_routing/another_screen');
          },
        ),
      ),
    );
  }
}
