import 'package:flutter/material.dart';
import 'package:rpg/models/mythos.dart';
import 'package:rpg/shared/mythos_row.dart';
import 'package:rpg/shared/mythos_scaffold.dart';

class NaturalMythosScreen extends StatelessWidget {
  const NaturalMythosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MythosScaffold(
      title: 'Natural Mythos',
      currentIndex: 0,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MythosRow(
            heading: 'Element Focus',
            entries: sampleMythosList.map((m) => m.elementFocus).toList(),
          ),
          MythosRow(
            heading: 'Sacred Sites',
            entries: sampleMythosList.map((m) => m.sacredSites).toList(),
          ),
          MythosRow(
            heading: 'Creatures',
            entries: sampleMythosList.map((m) => m.creatures).toList(),
          ),
        ],
      ),
    );
  }
}
