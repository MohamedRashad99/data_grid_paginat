import 'package:flutter/material.dart';

import 'package:go_router_example/pagination_pluto_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: PaginatedPlutoGrid(),
    );


  }
}

