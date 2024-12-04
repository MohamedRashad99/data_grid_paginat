import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.title});
  final String title;

  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C69C0),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times'),
            Text(
              '$_counter',
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Click to Details')),
          ],
        ),
      ),
    );
  }
}
