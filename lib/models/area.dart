import 'character.dart';
import 'mythos.dart';

enum AreaType { town, battlefield, dungeon, forest, village, temple }

enum TerrainType { rocky, plain, swamp, forest, desert }


class Area {
  final String id; // Unique ID
  final String name; // Name of the area
  final String image;
  final AreaType areaType;
  final TerrainType terrainType;

  // Associations
  final List<Character> characters; // Characters who reside or frequent the area
  final List<MythosEntry> sacredSites; // Mythos sacred sites
  final List<MythosEntry> creatures; // Mythos creatures inhabiting the area

  // Optional description
  final String? description;

  Area({
    required this.id,
    required this.image,
    required this.name,
    required this.areaType,
    required this.terrainType,
    this.characters = const [],
    this.sacredSites = const [],
    this.creatures = const [],
    this.description,
  });

  @override
  String toString() {
    return 'Area(name: $name, type: $areaType, terrain: $terrainType, characters: ${characters.length}, sacredSites: ${sacredSites.length}, creatures: ${creatures.length})';
  }
}


final List<Area> sampleAreas = [
// ---------------- FOREST ----------------
Area(
id: "forest1",
name: "Emerald Forest",
  image: "assets/img/areas/Emerald Forest.jpg",
areaType: AreaType.forest,
terrainType: TerrainType.forest,
characters: [sampleCharacters[0], sampleCharacters[1]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "A dense forest filled with ancient magic and wandering spirits.",
),
Area(
id: "forest2",
name: "Whispering Woods",
  image: "assets/img/areas/Whispering Woods.jpeg",
areaType: AreaType.battlefield,
terrainType: TerrainType.forest,
characters: [sampleCharacters[2]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "Trees that seem to speak, hiding old secrets.",
),
Area(
id: "forest3",
image: "assets/img/vocations/algo_wizard.jpg",
name: "Silverleaf Grove",
areaType: AreaType.town,
terrainType: TerrainType.forest,
characters: [sampleCharacters[3], sampleCharacters[4]],
sacredSites: [sampleMythosList[2].sacredSites],
creatures: [sampleMythosList[2].creatures],
description: "A peaceful grove with sparkling leaves and serene paths.",
),
Area(
id: "forest4",
name: "Twilight Thicket",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.village,
terrainType: TerrainType.forest,
characters: [sampleCharacters[5]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "A dark thicket where sunlight barely reaches the ground.",
),
Area(
id: "forest5",
name: "Mossfang Hollow",
  image: "assets/img/areas/Mossfang Hollow.jpg",
areaType: AreaType.temple,
terrainType: TerrainType.forest,
characters: [sampleCharacters[6]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "An ancient hollow, sacred to forest spirits.",
),

// ---------------- ROCKY ----------------
Area(
id: "rocky1",
name: "Rockspire Mountains",
  image: "assets/img/areas/Rockspire Mountains.jpg",
areaType: AreaType.battlefield,
terrainType: TerrainType.rocky,
characters: [sampleCharacters[0]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "Jagged mountains echoing with ancient battles.",
),
Area(
id: "rocky2",
name: "Stonefang Pass",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.dungeon,
terrainType: TerrainType.rocky,
characters: [sampleCharacters[1]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "A treacherous pass where adventurers often get lost.",
),
Area(
id: "rocky3",
name: "Obsidian Cliffs",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.temple,
terrainType: TerrainType.rocky,
characters: [sampleCharacters[2]],
sacredSites: [sampleMythosList[2].sacredSites],
creatures: [sampleMythosList[2].creatures],
description: "Black cliffs that tower over the horizon.",
),
Area(
id: "rocky4",
name: "Granite Fortress",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.town,
terrainType: TerrainType.rocky,
characters: [sampleCharacters[3], sampleCharacters[4]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "A fortress carved from solid stone, standing strong for centuries.",
),
Area(
id: "rocky5",
name: "Boulder Fields",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.village,
terrainType: TerrainType.rocky,
characters: [sampleCharacters[5]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "Fields littered with enormous boulders, dangerous to traverse.",
),

// ---------------- PLAIN ----------------
Area(
id: "plain1",
name: "Golden Plains",
  image: "assets/img/areas/Golden Plains.jpg",
areaType: AreaType.town,
terrainType: TerrainType.plain,
characters: [sampleCharacters[0], sampleCharacters[1]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "Endless plains where farmers thrive in peace.",
),
Area(
id: "plain2",
name: "Windy Meadows",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.forest,
terrainType: TerrainType.plain,
characters: [sampleCharacters[2]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "Open fields with strong winds and scattered wildflowers.",
),
Area(
id: "plain3",
name: "Sunlit Prairie",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.village,
terrainType: TerrainType.plain,
characters: [sampleCharacters[3]],
sacredSites: [sampleMythosList[2].sacredSites],
creatures: [sampleMythosList[2].creatures],
description: "A sunny prairie perfect for grazing animals.",
),
Area(
id: "plain4",
name: "Amber Fields",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.battlefield,
terrainType: TerrainType.plain,
characters: [sampleCharacters[4]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "Fields where legendary skirmishes once took place.",
),
Area(
id: "plain5",
name: "Meadow of Whispers",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.temple,
terrainType: TerrainType.plain,
characters: [sampleCharacters[5]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "A calm meadow where the wind seems to speak.",
),

// ---------------- SWAMP ----------------
Area(
id: "swamp1",
name: "Mire of Shadows",
  image: "assets/img/areas/Mire of Shadows.jpg",
areaType: AreaType.dungeon,
terrainType: TerrainType.swamp,
characters: [sampleCharacters[0]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "Dark, wet swamp teeming with hidden creatures.",
),
Area(
id: "swamp2",
name: "Foggy Marsh",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.village,
terrainType: TerrainType.swamp,
characters: [sampleCharacters[1]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "A marsh covered in mist and haunting sounds.",
),
Area(
id: "swamp3",
name: "Bog of Echoes",
areaType: AreaType.battlefield,
  image: "assets/img/vocations/algo_wizard.jpg",
terrainType: TerrainType.swamp,
characters: [sampleCharacters[2]],
sacredSites: [sampleMythosList[2].sacredSites],
creatures: [sampleMythosList[2].creatures],
description: "A treacherous bog where sounds carry unnaturally far.",
),
Area(
id: "swamp4",
name: "Murkwater Hollow",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.temple,
terrainType: TerrainType.swamp,
characters: [sampleCharacters[3]],
sacredSites: [sampleMythosList[0].sacredSites],
creatures: [sampleMythosList[0].creatures],
description: "Sacred hollow hidden deep in the swamp.",
),
Area(
id: "swamp5",
name: "Sorrow Swamp",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.forest,
terrainType: TerrainType.swamp,
characters: [sampleCharacters[4]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "A murky swamp haunted by old magic.",
),

// ---------------- DESERT ----------------
Area(
id: "desert1",
name: "Sunburn Dunes",
  image: "assets/img/areas/Sunburn Dunes.jpeg",
areaType: AreaType.village,
terrainType: TerrainType.desert,
characters: [sampleCharacters[0]],
sacredSites: [],
creatures: [sampleMythosList[0].creatures],
description: "A scorching desert dotted with resilient villages.",
),
Area(
id: "desert2",
name: "Crimson Expanse",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.town,
terrainType: TerrainType.desert,
characters: [sampleCharacters[1]],
sacredSites: [sampleMythosList[1].sacredSites],
creatures: [sampleMythosList[1].creatures],
description: "Vast desert sands under a blazing sun.",
),
Area(
id: "desert3",
name: "Golden Mirage",
  image: "assets/img/vocations/algo_wizard.jpg",
areaType: AreaType.temple,
terrainType: TerrainType.desert,
characters: [sampleCharacters[2]],
description: "Vast desert sands under a blazing sun.",)];

