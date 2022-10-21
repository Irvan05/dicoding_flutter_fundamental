import 'package:flutter/material.dart';

/// first_screen.dart
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go to Second Screen'),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/navigation_and_routing/second_screen');
              },
            ),
            ElevatedButton(
              child: const Text('Navigation with Data'),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/navigation_and_routing/second_screen_with_data',
                    arguments: 'Hello from First Screen!');
              },
            ),
            ElevatedButton(
              child: const Text('Return Data from Another Screen'),
              onPressed: () async {
                // final scaffoldMessenger = ScaffoldMessenger.of(context);
                final result = await Navigator.pushNamed(
                    context, '/navigation_and_routing/return_data_screen');
                // SnackBar snackBar = SnackBar(content: Text('$result'));
                // scaffoldMessenger.showSnackBar(snackBar);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$result'),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Replace Screen'),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/navigation_and_routing/replacement_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
