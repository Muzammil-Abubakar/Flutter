import 'package:flutter/material.dart';
import 'package:rpg/shared/styled_text.dart';
import '../../models/mythos.dart';

class MythosEntryDetailScreen extends StatelessWidget {
  final MythosEntry entry;

  const MythosEntryDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(entry.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (entry.image != null)
              Image.asset(
                entry.image!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            StyledHeading(entry.title),
            const SizedBox(height: 12),
            StyledText(
              entry.description
            ),
          ],
        ),
      ),
    );
  }
}
