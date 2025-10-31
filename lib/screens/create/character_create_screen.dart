import 'package:flutter/material.dart';
import 'package:rpg/models/mythos.dart';
import 'package:rpg/themes.dart';
import '../../models/character.dart';
import '../../shared/styled_text.dart';
import '../../shared/styled_button.dart';

class CharacterCreateScreen extends StatefulWidget {
  const CharacterCreateScreen({super.key});

  @override
  State<CharacterCreateScreen> createState() => _CharacterCreateScreenState();
}

class _CharacterCreateScreenState extends State<CharacterCreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  final List<String> affiliations = ['Hero', 'Villain', 'Side Hero', 'Side Villain'];
  String selectedAffiliation = 'Hero';

  // Selected Mythos entries
  late MythosEntry selectedBelief;
  late MythosEntry selectedTradition;
  late MythosEntry selectedElement;

  @override
  void initState() {
    super.initState();
    final firstMythos = sampleMythosList.first;
    selectedBelief = firstMythos.beliefs;
    selectedTradition = firstMythos.traditions;
    selectedElement = firstMythos.elementFocus;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  void _showAlert(String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: StyledHeading(title),
        content: StyledText(content),
        actions: [
          StyledButton(
            onPressed: () => Navigator.pop(ctx),
            child: const StyledHeading('Close'),
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void _createCharacter() {
    if (_nameController.text.trim().isEmpty) {
      _showAlert('Missing Name', 'Every character needs a name.');
      return;
    }
    if (_roleController.text.trim().isEmpty) {
      _showAlert('Missing Role', 'Please specify the character\'s role.');
      return;
    }
    if (_goalController.text.trim().isEmpty) {
      _showAlert('Missing Goal', 'Please define the character\'s goal.');
      return;
    }

    final newCharacter = Character(
      name: _nameController.text.trim(),
      role: _roleController.text.trim(),
      goal: _goalController.text.trim(),
      affiliation: selectedAffiliation,
      beliefs: selectedBelief,
      traditions: selectedTradition,
      elementFocus: selectedElement,
    );

    Navigator.pop(context, newCharacter);
  }

  Widget _buildSelectableMythosRow(String heading, List<MythosEntry> entries,
      MythosEntry selectedEntry, Function(MythosEntry) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        StyledHeading(heading),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final entry = entries[index];
              final isSelected = entry == selectedEntry;

              return GestureDetector(
                onTap: () {
                  setState(() => onSelect(entry));
                },
                child: SizedBox(
                  width: 160,
                  height: 160,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isSelected ? AppColor.primaryColor : Colors.transparent,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: entry.image != null
                              ? Image.asset(entry.image!, fit: BoxFit.cover, width: double.infinity)
                              : Container(
                            color: Colors.grey[300],
                            child: const Center(child: Icon(Icons.image)),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('Create Character'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColor.primaryColor, size: 48)),
              const SizedBox(height: 12),
              const Center(child: StyledHeading('Enter Your Character Traits')),
              const SizedBox(height: 10),
              const Center(child: StyledText("May he have a great story")),
              const SizedBox(height: 12),
              TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
              const SizedBox(height: 12),
              TextField(controller: _roleController, decoration: const InputDecoration(labelText: 'Role')),
              const SizedBox(height: 12),
              TextField(controller: _goalController, decoration: const InputDecoration(labelText: 'Goal')),
              const SizedBox(height: 12),
              DropdownButton<String>(
                dropdownColor: AppColor.secondaryColor,
                iconEnabledColor: AppColor.primaryColor,

                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
                value: selectedAffiliation,
                items: affiliations.map((a) => DropdownMenuItem(value: a, child: Text(a))).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => selectedAffiliation = val);
                },
              ),
              _buildSelectableMythosRow(
                'Beliefs',
                sampleMythosList.map((m) => m.beliefs).toList(),
                selectedBelief,
                    (entry) => selectedBelief = entry,
              ),
              _buildSelectableMythosRow(
                'Traditions',
                sampleMythosList.map((m) => m.traditions).toList(),
                selectedTradition,
                    (entry) => selectedTradition = entry,
              ),
              _buildSelectableMythosRow(
                'Element Focus',
                sampleMythosList.map((m) => m.elementFocus).toList(),
                selectedElement,
                    (entry) => selectedElement = entry,
              ),
              const SizedBox(height: 20),
              StyledButton(
                onPressed: _createCharacter,
                child: const StyledHeading('Create Character'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
