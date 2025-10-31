import 'package:flutter/material.dart';
import 'package:rpg/models/mythos.dart';
import 'package:rpg/shared/mythos_row.dart';
import 'package:rpg/shared/mythos_scaffold.dart';

class CulturalMythosScreen extends StatelessWidget {
  const CulturalMythosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MythosScaffold(
      title: 'Cultural Mythos',
      currentIndex: 1,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MythosRow(
            heading: 'Beliefs',
            entries: sampleMythosList.map((m) => m.beliefs).toList(),
          ),
          MythosRow(
            heading: 'Origin Stories',
            entries: sampleMythosList.map((m) => m.originStory).toList(),
          ),
          MythosRow(
            heading: 'Traditions',
            entries: sampleMythosList.map((m) => m.traditions).toList(),
          ),
        ],
      ),
    );
  }
}
