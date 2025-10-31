import 'package:flutter/material.dart';

import 'package:rpg/screens/Student/student_page.dart';

import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/themes.dart';

void main() {
  runApp(
    MaterialApp(
      theme: primaryTheme,
      home: StudentPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  final List<String> tavernNames = const [
    "The Drunken Dragon",
    "The Silver Tankard",
    "The Wandering Wyvern",
    "The Gilded Griffin",
    "The Broken Compass",
    "The Singing Serpent",
    "The Crimson Chalice",
    "The Laughing Goblin",
    "The Whispering Wolf",
    "The Frosted Flagon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledHeading("Sandbox"), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: tavernNames.length,
        itemBuilder: (context, index) {
          final name = tavernNames[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(name, style: Theme.of(context).textTheme.titleMedium),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.local_drink, color: Colors.brown),
                  SizedBox(width: 8),
                  Icon(Icons.shield, color: Colors.grey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}