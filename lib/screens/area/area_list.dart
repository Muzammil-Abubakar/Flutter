import 'package:flutter/material.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/models/area.dart';
import 'package:rpg/screens/area/area_profile.dart';

class AreaList extends StatelessWidget {
  const AreaList({super.key});

  @override
  Widget build(BuildContext context) {
    // Group areas by terrain
    final Map<TerrainType, List<Area>> terrainMap = {};
    for (var area in sampleAreas) {
      terrainMap.putIfAbsent(area.terrainType, () => []).add(area);
    }

    return Scaffold(
      appBar: AppBar(title: const StyledHeading("Areas by Terrain")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: terrainMap.entries
              .map(
                (entry) => AreaRow(
              heading: entry.key.name.toUpperCase(),
              areas: entry.value,
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class AreaRow extends StatelessWidget {
  final String heading;
  final List<Area> areas;

  const AreaRow({super.key, required this.heading, required this.areas});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 160.0;
    final double cardWidth = cardHeight * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        StyledHeading(heading),
        const SizedBox(height: 8),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: areas.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final area = areas[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AreaProfileScreen(area: area),
                    ),
                  );
                },
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Image ~75%
                        Expanded(
                          flex: 3,
                          child: Image.asset(
                            'assets/img/vocations/ux_ninja.jpg', // placeholder
                            fit: BoxFit.cover,
                            width: double.infinity,
                            // TODO: dynamically: 'assets/img/areas/${area.name}.jpg'
                          ),
                        ),
                        // Name & Type ~25%
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StyledText(area.name),
                                  const SizedBox(height: 2),

                                ],
                              ),
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
    );
  }
}