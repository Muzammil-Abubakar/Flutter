import 'package:flutter/material.dart';
import 'package:rpg/models/area.dart';
import 'package:rpg/models/mythos.dart';
import 'package:rpg/shared/styled_text.dart';
import '../character/character_profile.dart';
import '../mythos/MythosEntryDetailScreen.dart';

class AreaProfileScreen extends StatelessWidget {
  final Area area;

  const AreaProfileScreen({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(area.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledHeading('Terrain: ${area.terrainType.name.toUpperCase()}'),
              const SizedBox(height: 4),
              StyledText('Area Type: ${area.areaType.name.toUpperCase()}'),
              const SizedBox(height: 8),
              StyledText('Description: ${area.description}'),
              const SizedBox(height: 16),

              // Characters
              if (area.characters.isNotEmpty) ...[
                StyledHeading('Characters'),
                const SizedBox(height: 8),
                Column(
                  children: area.characters
                      .map(
                        (c) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CharacterProfileScreen(character: c),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: StyledText(c.name),
                          subtitle: StyledText(c.role),
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
                const SizedBox(height: 16),
              ],

              // Sacred Sites
              if (area.sacredSites.isNotEmpty) ...[
                StyledHeading('Sacred Sites'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: area.sacredSites.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final MythosEntry site = area.sacredSites[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MythosEntryDetailScreen(entry: site),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 140,
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: site.image != null
                                      ? Image.asset(
                                    site.image!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                      : Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                        child: Icon(Icons.image)),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: StyledText(site.title)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Creatures
              if (area.creatures.isNotEmpty) ...[
                StyledHeading('Creatures'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: area.creatures.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final MythosEntry creature = area.creatures[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MythosEntryDetailScreen(entry: creature),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 140,
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: creature.image != null
                                      ? Image.asset(
                                    creature.image!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                      : Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                        child: Icon(Icons.image)),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: StyledText(creature.title)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
