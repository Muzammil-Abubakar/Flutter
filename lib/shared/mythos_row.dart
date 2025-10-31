import 'package:flutter/material.dart';
import 'package:rpg/shared/styled_text.dart';
import '../models/mythos.dart';
import '../screens/mythos/MythosEntryDetailScreen.dart';

class MythosRow extends StatelessWidget {
  final String heading;
  final List<MythosEntry> entries;

  const MythosRow({
    super.key,
    required this.heading,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 160.0; // keep height fixed
    final double cardWidth = cardHeight * 1.5; // width 50% more than height

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        StyledHeading(heading),
        const SizedBox(height: 8),
        SizedBox(
          height: cardHeight, // parent container height
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final entry = entries[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MythosEntryDetailScreen(entry: entry),
                    ),
                  );
                },
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        // Image ~75%
                        Expanded(
                          flex: 3,
                          child: entry.image != null
                              ? Image.asset(
                            entry.image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                              : Container(
                            color: Colors.grey[300],
                            child: const Center(
                                child: Icon(Icons.image)),
                          ),
                        ),
                        // Title ~25%
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
              );
            },
          ),
        ),
      ],
    );
  }
}
