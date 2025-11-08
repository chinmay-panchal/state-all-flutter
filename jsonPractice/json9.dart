import 'dart:collection';
import 'dart:convert';
import 'dart:math';

void main() {
  String jsonString = '''{
    "students": [
      {"name": "Alice", "marks": [80, 70, 90]},
      {"name": "Bob", "marks": [60, 65, 70]},
      {"name": "Charlie", "marks": [95, 100, 85]},
      {"name": "Chinmay", "marks": [95, 100, 85]},
      {"name": "David", "marks": [88, 76, 92]}
    ]
  }
  ''';

  final data = jsonDecode(jsonString);
  List<Student> studentList = (data['students'] as List)
      .map((e) => Student(name: e['name'], marks: List<int>.from(e['marks'])))
      .toList();

  Map<String, double> av = {};
  double maxavg = 0;
  studentList.forEach((e) {
    double avg = 0;
    for (int i = 0; i < e.marks.length; i++) {
      avg += e.marks[i];
    }
    avg = avg / e.marks.length;
    if (maxavg <= avg) {
      maxavg = avg;
    }
    av[e.name] = avg;
  });

  List<String> topStudents = [];
  av.forEach((student, avg) {
    if (avg == maxavg) {
      topStudents.add(student);
    }
  });

  print({
    'top_students': topStudents,
    'highest_avg': maxavg
  });
}

class Student {
  String name;
  List<int> marks;

  Student({required this.name, required this.marks});
}
