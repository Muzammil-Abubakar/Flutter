import 'package:flutter/material.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/themes.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandbox"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Text('Sandbox'),
    );
  }
}
