import 'dart:convert';
import 'dart:math';

void main() {
  String jsonString = '''{
    "employees": [
      {"name": "Alice", "department": "HR", "salary": 5000},
      {"name": "Bob", "department": "IT", "salary": 7000},
      {"name": "Charlie", "department": "HR", "salary": 6000},
      {"name": "David", "department": "IT", "salary": 8000},
      {"name": "Eva", "department": "Finance", "salary": 6500}
    ]
  }
  ''';

  final data = jsonDecode(jsonString);

  // List<Employee> employees = (data['employees'] as List)
  //     .map((e) => Employee.fromJson(e as Map<String, dynamic>))
  //     .toList();

  List<Employee> employees = (data['employees'] as List)
      .map(
        (employee) => Employee(
          name: employee['name'],
          department: employee["department"],
          salary: employee['salary'],
        ),
      )
      .toList();

  Map<String, int> mapp = {};

  for (var employee in employees) {
    final dept = employee.department;
    final sal = employee.salary ?? 0;
    if (dept != null) {
      mapp[dept] = (mapp[dept] ?? 0) + sal;
    }
  }

  int maxsalary = 0;
  mapp.forEach((dep, salary) {
    if (maxsalary < salary) {
      maxsalary = salary;
    }
  });

  String depart = 'exception dep';
  mapp.forEach((dep, salary) {
    if (maxsalary == salary) {
      depart = dep;
    }
  });

  print({'department_expenses': mapp, "max_department": depart});
}

class Employee {
  Employee({
    required this.name,
    required this.department,
    required this.salary,
  });

  final String? name;
  final String? department;
  final int? salary;

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json["name"],
      department: json["department"],
      salary: json["salary"],
    );
  }
}