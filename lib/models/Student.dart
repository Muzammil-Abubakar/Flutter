class Student {
  final String name;
  final String rollNo;
  final List<String> tasksDone;

  const Student({
    required this.name,
    required this.rollNo,
    required this.tasksDone,
  });
}

final List<Student> students = const [
  Student(
    name: "Muzammil",
    rollNo: "FA22-BCS-116",
    tasksDone: ["Task A", "Task B"],
  ),
  Student(
    name: "Abdullah",
    rollNo: "FA22-BCS-036",
    tasksDone: ["Task C", "Task D"],
  ),
  Student(
    name: "Mubeen",
    rollNo: "FA22-BCS-112",
    tasksDone: ["Task E", "Task F"],
  ),
  Student(
    name: "Sarim",
    rollNo: "FA22-BCS-128",
    tasksDone: ["Task G", "Task H"],
  ),
];
