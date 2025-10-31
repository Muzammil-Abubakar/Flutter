import 'package:flutter/material.dart';
import '../../models/character.dart';
import '../../models/mythos.dart';
import '../../shared/styled_text.dart';
import '../mythos/MythosEntryDetailScreen.dart';

class CharacterProfileScreen extends StatelessWidget {
  final Character character;

  const CharacterProfileScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Role & Affiliation
              StyledHeading('Role: ${character.role}'),
              const SizedBox(height: 4),
              StyledText('Affiliation: ${character.affiliation}'),
              const SizedBox(height: 8),
              StyledText('Goal: ${character.goal}'),
              const SizedBox(height: 16),

              // Mythos sections
              _buildMythosSection(context, 'Belief', character.beliefs),
              const SizedBox(height: 12),
              _buildMythosSection(context, 'Tradition', character.traditions),
              const SizedBox(height: 12),
              _buildMythosSection(context, 'Elemental Focus', character.elementFocus),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMythosSection(BuildContext context, String heading, MythosEntry entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledHeading(heading),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MythosEntryDetailScreen(entry: entry),
              ),
            );
          },
          child: SizedBox(
            height: 180, // keep original card height
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  // Image 75%
                  Expanded(
                    flex: 3,
                    child: entry.image != null
                        ? Image.asset(
                      entry.image!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.image)),
                    ),
                  ),
                  // Title 25%
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: StyledText(entry.title),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
