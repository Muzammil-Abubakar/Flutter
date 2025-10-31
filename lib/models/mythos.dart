class MythosEntry {
  final String title;
  final String description;
  final String? image; // optional, can be null

  const MythosEntry({
    required this.title,
    required this.description,
    this.image,
  });
}

class Mythos {
  // Cultural
  final MythosEntry beliefs;
  final MythosEntry originStory;
  final MythosEntry traditions;

  // Natural
  final MythosEntry elementFocus;
  final MythosEntry sacredSites;
  final MythosEntry creatures;

  // Historic
  final MythosEntry lostAge;
  final MythosEntry turningPoint;
  final MythosEntry artifact;

  const Mythos({
    // Cultural
    required this.beliefs,
    required this.originStory,
    required this.traditions,

    // Natural
    required this.elementFocus,
    required this.sacredSites,
    required this.creatures,

    // Historic
    required this.lostAge,
    required this.turningPoint,
    required this.artifact,
  });
}

final List<Mythos> sampleMythosList = [
  Mythos(
    // Cultural
    beliefs: MythosEntry(
      title: "Harmony and Decay",
      description: "Harmony between creation and decay defines balance.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    originStory: MythosEntry(
      title: "Roots of the World Tree",
      description: "The first tribes rose from the roots of the World Tree after the Great Rain.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    traditions: MythosEntry(
      title: "New Moon Ritual",
      description: "Each new moon, villagers bury a seed to honor the fallen and renew life.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),

    // Natural
    elementFocus: MythosEntry(
      title: "Mist and Stone",
      description: "The land itself breathes with shifting fogs.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    sacredSites: MythosEntry(
      title: "Whispering Caves",
      description: "Echoes carry ancestral voices.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    creatures: MythosEntry(
      title: "Mistborne",
      description: "Spirits that take form from heavy fog and emotion.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),

    // Historic
    lostAge: MythosEntry(
      title: "Era of Glass Rivers",
      description: "Rivers froze mid-flow, dividing east and west forever.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    turningPoint: MythosEntry(
      title: "Frozen Rivers",
      description: "When the rivers froze mid-flow, dividing east and west forever.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    artifact: MythosEntry(
      title: "Obsidian Mirror",
      description: "A cracked obsidian mirror said to reveal a person’s truest memory.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
  ),

  Mythos(
    // Cultural
    beliefs: MythosEntry(
      title: "Cleverness Over Strength",
      description: "Strength is proven through cleverness, not bloodshed.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    originStory: MythosEntry(
      title: "Born from Storm Laughter",
      description: "Born from the laughter of the first storm, humankind learned to build and deceive.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    traditions: MythosEntry(
      title: "Tales Rewritten",
      description: "Tales are rewritten each year to remind all that truth is a flexible tool.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),

    // Natural
    elementFocus: MythosEntry(
      title: "Wind and Echo",
      description: "The endless dunes whisper old bargains.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    sacredSites: MythosEntry(
      title: "Singing Spire",
      description: "A monument that hums when storms approach.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    creatures: MythosEntry(
      title: "Dustjackals",
      description: "Loyal to those who never break an oath.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),

    // Historic
    lostAge: MythosEntry(
      title: "Age of Veils",
      description: "The great city of Vareth vanished overnight beneath the sand.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    turningPoint: MythosEntry(
      title: "City Disappears",
      description: "When the great city of Vareth vanished overnight beneath the sand.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    artifact: MythosEntry(
      title: "Wandering Compass",
      description: "A compass that never points north, only toward hidden lies.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
  ),

  Mythos(
    // Cultural
    beliefs: MythosEntry(
      title: "Memory is Sacred",
      description: "Memory itself is sacred; forgetting is a sin.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    originStory: MythosEntry(
      title: "First Sunrise Written",
      description: "The world began when a lone historian wrote the first sunrise into being.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    traditions: MythosEntry(
      title: "Collective Diary",
      description: "Citizens share one collective diary, continued across generations.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),

    // Natural
    elementFocus: MythosEntry(
      title: "Ink and Ash",
      description: "Even rivers stain the ground black.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    sacredSites: MythosEntry(
      title: "Library Without Doors",
      description: "Shelves change with the reader’s intent.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    creatures: MythosEntry(
      title: "Paperwings",
      description: "Tiny parchment birds that carry thoughts between minds.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),

    // Historic
    lostAge: MythosEntry(
      title: "Chronicle Wars",
      description: "When memories began to rot, entire decades vanished from record.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    turningPoint: MythosEntry(
      title: "Memory Rot",
      description: "When memories began to rot, entire decades vanished from record.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
    artifact: MythosEntry(
      title: "Silent Quill",
      description: "Rumored to erase the past instead of writing it.",
      image: "assets/img/vocations/algo_wizard.jpg",
    ),
  ),
];
