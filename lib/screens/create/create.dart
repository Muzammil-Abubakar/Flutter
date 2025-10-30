import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/screens/create/vocation_card.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/themes.dart';
import 'package:uuid/uuid.dart';



var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  Vocation selectedVocation = Vocation.junkie;

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void updateVocation(Vocation vocation){
    setState(() {
      selectedVocation = vocation;
    });
  }

  // Submit handler
  void handleSubmit(){
    if (_nameController.text.trim().isEmpty){
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: StyledHeading('Missing Character Name'),
          content: const StyledText('Everybody needs a name mate'),
          actions: [
            StyledButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: StyledHeading('Close'))
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    if (_sloganController.text.trim().isEmpty){
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: StyledHeading('Missing Character Slogan'),
          content: const StyledText('Announce Your Slogan to the World'),
          actions: [
            StyledButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: StyledHeading('Close'))
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    characters.add(
        Character(
          name: _nameController.text.trim(),
          slogan:_sloganController.text.trim(),
          vocation: selectedVocation,
          id: uuid.v4(),
        ));

    Navigator.push(context,MaterialPageRoute(builder: (ctx) => Home()) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Icon(Icons.code, color: AppColor.primaryColor)
              ),
              const Center(child: StyledHeading('Hello New Player')),
              const Center(
                child: StyledText(
                  'Create a new name & slogan for your character',
                ),
              ),
          
              const SizedBox(height: 30),
          
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColor.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name'),
                ),
              ),
          
              const SizedBox(height: 20),
          
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColor.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character Slogan'),
                ),
              ),
          
              SizedBox(height: 30,),
          
              //Vocation Title
          
              Center(
                  child: Icon(Icons.code, color: AppColor.primaryColor)
              ),
              const Center(
                  child: StyledHeading('Choose a Vocation')
              ),
              const Center(
                child: StyledText('This determines your available skills.')
              ),
          
              SizedBox(height: 30),
          
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),

          
              Center(
                child:  StyledButton(onPressed: handleSubmit, child: StyledHeading('Create')),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
