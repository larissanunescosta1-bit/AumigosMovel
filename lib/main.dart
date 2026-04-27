import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/TelaDois.dart';
import 'package:flutter_application_1/screens/TelaHome.dart';
import 'splash_screen.dart';
import 'categoria_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // trocando de telas
      body: _screens[_currentIndex],

      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  List<Widget> _screens = [
    new TelaHome(title: 'Primeira tela'),
    new TelaDois(title: 'Segunda tela'),
  ];

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex!,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Favoritos"),
      ],
    );
  }
}
