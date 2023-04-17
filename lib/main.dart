import 'package:flutter/material.dart';
import 'package:gdc/screens/home.dart';

import 'models/cores.dart';

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
      home: StartApp(),
    );
  }
}

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  int _currentIndex = 2;
  List<Widget> body = const [
    Scaffold(
      body: Center(
        child: Icon(Icons.newspaper),
      ),
    ),
    Scaffold(
      body: Center(
        child: Icon(Icons.bookmark),
      ),
    ),
    HomeScreen(),
    Scaffold(
      body: Center(
        child: Icon(Icons.info),
      ),
    ),
    Scaffold(
      body: Center(
        child: Icon(Icons.folder_copy),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedItemColor: Cores().laranja,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Cores().laranja,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Notícias',
              icon: Icon(
                Icons.newspaper,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Salvos',
              icon: Icon(
                Icons.bookmark,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Sobre',
              icon: Icon(
                Icons.info,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Mídia Social',
              icon: Icon(
                Icons.folder_copy,
              ),
            ),
          ]),
    );
  }
}
