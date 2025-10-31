import 'character.dart';
import 'area.dart';

class Event {

  final String title;
  final String description;
  final List<Character> characters;
  final Area area;

  const Event({
    required this.title,
    required this.description,
    required this.characters,
    required this.area,
  });
}


final List<Event> sampleEvents = [
  Event(
    title: "Battle at Whispering Woods",
    description: "A fierce battle between the northern and southern clans.",
    characters: [sampleCharacters[0], sampleCharacters[3]],
    area: sampleAreas[0], // Whispering Woods
  ),
  Event(
    title: "Desert Festival",
    description: "A festival celebrating the sun god in the Sunfire Desert.",
    characters: [sampleCharacters[4]],
    area: sampleAreas[4], // Sunfire Desert
  ),
  Event(
    title: "Dungeon Exploration",
    description: "A team of adventurers uncovers ancient traps and treasures.",
    characters: [sampleCharacters[2], sampleCharacters[8]],
    area: sampleAreas[1], // Crimson Keep
  ),
];
