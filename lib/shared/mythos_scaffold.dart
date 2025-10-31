import 'package:flutter/material.dart';
import 'package:rpg/shared/styled_text.dart';
import '../screens/mythos/natural_mythos_screen.dart';
import '../screens/mythos/cultural_mythos_screen.dart';
import '../screens/mythos/historic_mythos_screen.dart';

class MythosScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;

  const MythosScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.currentIndex,
  });

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget destination;
    switch (index) {
      case 0:
        destination = const NaturalMythosScreen();
        break;
      case 1:
        destination = const CulturalMythosScreen();
        break;
      default:
        destination = const HistoricMythosScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(title),
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => _navigate(context, i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.landscape), label: "Natural"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Cultural"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historic"),
        ],
      ),
    );
  }
}
