import 'package:flutter/material.dart';
import 'package:go_router_example/main.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});
  final String title;

  final int _counter = 0;

  void navigateToDetails(BuildContext context) {
 /// TODO:::: Navigate to Details Page

  }

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
                onPressed: () {
                },
                child: const Text('Click to Details')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetails(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
