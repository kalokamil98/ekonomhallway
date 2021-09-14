import 'package:flutter/material.dart';
import 'Chose.dart';
import 'Home.dart';
import 'Grupa.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Myapp());
}

String homeScrren = "/";

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    
    
    return MaterialApp(
      //  home: Chose(),
      initialRoute: homeScrren,
      routes: {
        '/': (context) => Chose(),
        '/Grupa': (context) => Grupa(),
        '/home': (context) => Home()
      },
    );
  }
}

