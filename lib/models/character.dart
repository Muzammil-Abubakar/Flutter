import 'mythos.dart';

class Character {
  final String name;
  final String role;         // limited to 4 types
  final String affiliation;  // Hero, Villain, Side Hero, Side Villain
  final String goal;

  // Mythos-related fields
  final MythosEntry beliefs;      // Cultural
  final MythosEntry traditions;   // Cultural
  final MythosEntry elementFocus; // Natural

  const Character({
    required this.name,
    required this.role,
    required this.affiliation,
    required this.goal,
    required this.beliefs,
    required this.traditions,
    required this.elementFocus,
  });
}


final List<Character> sampleCharacters = [
  Character(
    name: "Aelric",
    role: "Warrior",
    affiliation: "Hero",
    goal: "Defeat the Shadow King",
    beliefs: sampleMythosList[0].beliefs,
    traditions: sampleMythosList[0].traditions,
    elementFocus: sampleMythosList[0].elementFocus,
  ),
  Character(
    name: "Liora",
    role: "Mage",
    affiliation: "Side Hero",
    goal: "Master the Lost Arts",
    beliefs: sampleMythosList[1].beliefs,
    traditions: sampleMythosList[1].traditions,
    elementFocus: sampleMythosList[1].elementFocus,
  ),
  Character(
    name: "Kael",
    role: "Rogue",
    affiliation: "Villain",
    goal: "Steal the Crown Jewels",
    beliefs: sampleMythosList[2].beliefs,
    traditions: sampleMythosList[2].traditions,
    elementFocus: sampleMythosList[2].elementFocus,
  ),
  Character(
    name: "Seraphina",
    role: "Ranger",
    affiliation: "Side Hero",
    goal: "Heal the Wounded Lands",
    beliefs: sampleMythosList[0].beliefs,
    traditions: sampleMythosList[0].traditions,
    elementFocus: sampleMythosList[1].elementFocus,
  ),
  Character(
    name: "Thorn",
    role: "Warrior",
    affiliation: "Hero",
    goal: "Protect the Ancient Forests",
    beliefs: sampleMythosList[1].beliefs,
    traditions: sampleMythosList[2].traditions,
    elementFocus: sampleMythosList[0].elementFocus,
  ),
  Character(
    name: "Elara",
    role: "Mage",
    affiliation: "Side Villain",
    goal: "Compose the Song of Ages",
    beliefs: sampleMythosList[2].beliefs,
    traditions: sampleMythosList[1].traditions,
    elementFocus: sampleMythosList[2].elementFocus,
  ),
  Character(
    name: "Draven",
    role: "Rogue",
    affiliation: "Hero",
    goal: "Bring Justice to the Outlands",
    beliefs: sampleMythosList[0].beliefs,
    traditions: sampleMythosList[2].traditions,
    elementFocus: sampleMythosList[1].elementFocus,
  ),
  Character(
    name: "Nyssa",
    role: "Ranger",
    affiliation: "Villain",
    goal: "Unlock the Chronomancer’s Secrets",
    beliefs: sampleMythosList[1].beliefs,
    traditions: sampleMythosList[0].traditions,
    elementFocus: sampleMythosList[2].elementFocus,
  ),
  Character(
    name: "Ronan",
    role: "Warrior",
    affiliation: "Side Villain",
    goal: "Track the Beast of Legends",
    beliefs: sampleMythosList[2].beliefs,
    traditions: sampleMythosList[2].traditions,
    elementFocus: sampleMythosList[1].elementFocus,
  ),
  Character(
    name: "Isolde",
    role: "Mage",
    affiliation: "Hero",
    goal: "Transmute Base to Gold",
    beliefs: sampleMythosList[0].beliefs,
    traditions: sampleMythosList[1].traditions,
    elementFocus: sampleMythosList[2].elementFocus,
  ),
];
