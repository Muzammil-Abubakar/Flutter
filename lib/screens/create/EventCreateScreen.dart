import 'package:flutter/material.dart';
import '../../models/event.dart';
import '../../models/character.dart';
import '../../models/area.dart';
import '../../shared/styled_text.dart';
import '../../shared/styled_button.dart';

class EventCreateScreen extends StatefulWidget {
  const EventCreateScreen({super.key});

  @override
  State<EventCreateScreen> createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  Area? selectedArea;
  List<Character> selectedCharacters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeading("Create Event"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading("Title"),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: "Enter Event Title", hintStyle: TextStyle(color: Colors.grey) ),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),

                StyledHeading("Description"),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: _descController,
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: "Enter Event Title", hintStyle: TextStyle(color: Colors.grey) ),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),

                StyledHeading("Select Area"),
                DropdownButtonFormField<Area>(
                  dropdownColor: Colors.black,
                  value: selectedArea,
                  items: sampleAreas
                      .map((area) => DropdownMenuItem(
                    value: area,
                    child: Text(area.name),
                  ))
                      .toList(),
                  onChanged: (area) => setState(() => selectedArea = area),
                  validator: (value) => value == null ? "Select an area" : null,
                ),
                const SizedBox(height: 12),

                StyledHeading("Select Characters"),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: sampleCharacters.map((character) {
                    final isSelected = selectedCharacters.contains(character);
                    return ChoiceChip(
                      backgroundColor: Colors.black,

                      label: Text(character.name, style: TextStyle(color: isSelected ? Colors.black : Colors.red),),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedCharacters.add(character);
                          } else {
                            selectedCharacters.remove(character);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                Center(
                  child: StyledButton(
                    child: StyledHeading("Create Event"),
                    onPressed: () {
                      if (_formKey.currentState!.validate() && selectedArea != null) {
                        final newEvent = Event(
                          title: _titleController.text,
                          description: _descController.text,
                          characters: selectedCharacters,
                          area: selectedArea!,
                        );
                        Navigator.pop(context, newEvent); // return the new event
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
