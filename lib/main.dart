import 'package:flutter/material.dart';
import 'package:gdc/models/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Cores().azul,
        appBar: AppBar(
          title: const Text('Initial GDC App'),
        ),
      ),
    );
  }
}
