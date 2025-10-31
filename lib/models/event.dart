import 'character.dart';
import 'area.dart';

class Event {
  final String id; // optional, for unique identification
  final String title;
  final String description;
  final List<Character> characters; // characters associated with this event
  final Area area; // the area where this event takes place

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.characters,
    required this.area,
  });
}


final List<Event> sampleEvents = [
  Event(
    id: "event1",
    title: "Battle at Whispering Woods",
    description: "A fierce battle between the northern and southern clans.",
    characters: [sampleCharacters[0], sampleCharacters[3]],
    area: sampleAreas[0], // Whispering Woods
  ),
  Event(
    id: "event2",
    title: "Desert Festival",
    description: "A festival celebrating the sun god in the Sunfire Desert.",
    characters: [sampleCharacters[4]],
    area: sampleAreas[4], // Sunfire Desert
  ),
  Event(
    id: "event3",
    title: "Dungeon Exploration",
    description: "A team of adventurers uncovers ancient traps and treasures.",
    characters: [sampleCharacters[2], sampleCharacters[8]],
    area: sampleAreas[1], // Crimson Keep
  ),
];
