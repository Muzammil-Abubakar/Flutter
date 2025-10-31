import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/themes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key,
  required this.character});

  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Basic Info - Image, Vocation, description
            Container(
              padding: EdgeInsets.all(16),
              color: AppColor.secondaryColor.withValues(alpha: 0.3),
              child: Row(
                children: [

                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ],
                    ),
                  )
                ],
              ),
            ),
            // Weapon and Ability

            // Stats & skills

            // Save Button

          ],
        ),
      ),
    );
  }
}
