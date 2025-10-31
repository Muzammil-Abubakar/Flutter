import 'package:flutter/material.dart';
import 'package:rpg/models/mythos.dart';
import 'package:rpg/shared/mythos_row.dart';
import 'package:rpg/shared/mythos_scaffold.dart';

class HistoricMythosScreen extends StatelessWidget {
  const HistoricMythosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MythosScaffold(
      title: 'Historic Mythos',
      currentIndex: 2,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MythosRow(
            heading: 'Lost Ages',
            entries: sampleMythosList.map((m) => m.lostAge).toList(),
          ),
          MythosRow(
            heading: 'Turning Points',
            entries: sampleMythosList.map((m) => m.turningPoint).toList(),
          ),
          MythosRow(
            heading: 'Artifacts',
            entries: sampleMythosList.map((m) => m.artifact).toList(),
          ),
        ],
      ),
    );
  }
}
