import 'dart:convert';

import 'json5.dart';

void main() {
  String jsonString = '''{
    "students": [
      {"name": "Alice", "marks": [80, 90, 85]},
      {"name": "Bob", "marks": [70, 60, 75]},
      {"name": "Charlie", "marks": [95, 100, 90]}
    ]
  }
  ''';

  final data = jsonDecode(jsonString);
  List<Student> students = (data['students'] as List)
      .map(
        (e) => Student(
          name: e['name'],
          marks: (e['marks'] as List).map((mark) => mark as int).toList(),
        ),
      )
      .toList();

  Map<String, double> avg = {};
  for (int i = 0; i < students.length; i++) {
    double marks = 0;
    students[i].marks.forEach((e) {
      marks += e;
    });

    double average = marks / students[i].marks.length;
    avg[students[i].name] = average;
  }
  print({'average': avg});
}

class Student {
  String name;
  List<int> marks;

  Student({required this.name, required this.marks});
}
