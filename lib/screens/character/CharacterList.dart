import 'package:flutter/material.dart';
import 'package:rpg/screens/create/character_create_screen.dart';
import '../../models/character.dart';
import '../character/character_profile.dart';
import '../../shared/styled_text.dart';
import '../../shared/styled_button.dart';


class CharacterList extends StatefulWidget {
  final List<Character> initialCharacters;

  const CharacterList({super.key, required this.initialCharacters});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late List<Character> characters;

  @override
  void initState() {
    super.initState();
    characters = List.from(widget.initialCharacters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Characters'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // Name & Role
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StyledHeading(character.name),
                                const SizedBox(height: 4),
                                StyledText(character.affiliation),
                              ],
                            ),
                          ),
                          // Navigate button
                          IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CharacterProfileScreen(character: character),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: StyledButton(
                onPressed: () async {
                  // Navigate to create page and wait for new character
                  final newCharacter = await Navigator.push<Character>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CharacterCreateScreen(),
                    ),
                  );

                  if (newCharacter != null) {
                    setState(() {
                      characters.add(newCharacter);
                    });
                  }
                },
                child: const StyledText('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
