import 'dart:convert';

void main() {
  String jsonString = '''{
    "employees": [
      {"name": "Alice", "department": "HR"},
      {"name": "Bob", "department": "IT"},
      {"name": "Charlie", "department": "HR"},
      {"name": "David", "department": "IT"},
      {"name": "Eva", "department": "Finance"}
    ]
  }
  ''';

  final data = jsonDecode(jsonString);
  List<Employee> employees = (data['employees'] as List)
      .map((e) => Employee(name: e['name'], department: e['department']))
      .toList();

  Map<String, List<String>> mapp = {};

  employees.forEach((e) {
    if (mapp[e.department] == null) {
      mapp[e.department] = [e.name];
    } else {
      mapp[e.department]?.add(e.name);
    }
  });

  print(mapp);
}

class Employee {
  String name;
  String department;

  Employee({required this.name, required this.department});
}
