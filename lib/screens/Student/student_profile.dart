import 'package:flutter/material.dart';
import 'package:rpg/models/Student.dart';
import 'package:rpg/shared/styled_text.dart';

class StudentProfile extends StatelessWidget {
  final Student student;

  const StudentProfile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(student.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            StyledHeading('Name: ${student.name}'),
            const SizedBox(height: 40),
            StyledHeading('Roll No: ${student.rollNo}'),
            const SizedBox(height: 40),
            const StyledHeading('Tasks Completed:'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: student.tasksDone.length,
                itemBuilder: (context, index) {
                  final task = student.tasksDone[index];
                  return ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: StyledHeading(task),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
