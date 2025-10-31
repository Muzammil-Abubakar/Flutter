import 'package:flutter/material.dart';
import 'package:rpg/models/area.dart';
import 'package:rpg/screens/area/area_list.dart';
import 'package:rpg/screens/character/CharacterList.dart';
import 'package:rpg/screens/character/character_profile.dart';
import 'package:rpg/screens/mythos/cultural_mythos_screen.dart';
import 'package:rpg/screens/mythos/natural_mythos_screen.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/themes.dart';

import 'models/character.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.45;
    final double cardHeight = 220;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),

              // 👇 Intro Section
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColor.primaryColor,
                  size: 48,
                ),
              ),
              const SizedBox(height: 12),
              const Center(child: StyledHeading('Choose Your Destination')),
              SizedBox(height: 10,),
              const Center(
                child: StyledText(
                  "Manage Your Novel's",
                ),
              ),

              const SizedBox(height: 40),

              // 👇 Cards Section
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  NavCards(
                      context,
                      "Characters",
                      "assets/img/vocations/algo_wizard.jpg",
                      cardWidth,
                      cardHeight,
                      CharacterList(initialCharacters: sampleCharacters,)
                  ),
                  NavCards(
                      context,
                      "Areas",
                      "assets/img/vocations/code_junkie.jpg",
                      cardWidth,
                      cardHeight,
                      AreaList()
                  ),
                  NavCards(
                      context,
                      "Mythos",
                      "assets/img/vocations/ux_ninja.jpg",
                      cardWidth,
                      cardHeight,
                      CulturalMythosScreen()
                  ),
                  NavCards(
                      context,
                      "Events",
                      "assets/img/vocations/terminal_raider.jpg",
                      cardWidth,
                      cardHeight,
                      CulturalMythosScreen()
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget NavCards(
      BuildContext context,
      String title,
      String imagePath,
      double cardWidth,
      double cardHeight,
      Widget widget
      ) {
    return SizedBox(
      width: cardWidth.clamp(140, 220),
      height: cardHeight.clamp(140, 220),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (ctx) => widget) );
        },
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Expanded(
                flex: 3, // 75%
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Expanded(
                flex: 1, // 25%
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: StyledTitle(title),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}