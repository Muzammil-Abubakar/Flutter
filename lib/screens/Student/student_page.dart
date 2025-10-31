import 'package:flutter/material.dart';
import 'package:rpg/home.dart';
import 'package:rpg/main.dart';
import 'package:rpg/models/Student.dart';
import 'package:rpg/screens/Student/student_profile.dart';

import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = screenWidth * 0.45; // 45% of screen width
    final cardHeight = screenHeight * 0.22; // 22% of screen height

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Image.asset('assets/img/logo/DMC_Logo3.png', width: 200),
              const SizedBox(height: 30),
              const StyledHeading('Novel Builder'),
              const SizedBox(height: 50),

              // Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStudentCard(context, students[0], cardWidth, cardHeight),
                  const SizedBox(width: 12),
                  _buildStudentCard(context, students[1], cardWidth, cardHeight),
                ],
              ),
              const SizedBox(height: 12),

              // Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStudentCard(context, students[2], cardWidth, cardHeight),
                  const SizedBox(width: 12),
                  _buildStudentCard(context, students[3], cardWidth, cardHeight),
                ],
              ),

              const SizedBox(height: 20),

              StyledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Home()),
                  );
                },
                child: const StyledHeading('START'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentCard(
      BuildContext context, Student student, double cardWidth, double cardHeight) {
    return SizedBox(
      width: cardWidth.clamp(140, 220),
      height: cardHeight.clamp(140, 220),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StudentProfile(student: student),
            ),
          );
        },
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.shield,
                  size: 40,
                  color: Colors.red,
                ),
                const SizedBox(height: 8),
                StyledText(student.name),
                StyledText(student.rollNo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
