import 'dart:convert';

void main() {
  String jsonString = '''{
    "marks": [35, 50, 70, 90, 45, 82, 50]
  }''';

  final data = jsonDecode(jsonString);

  List<int> marks = List<int>.from(data['marks']);

  int less = 0;
  int greater = 0;

  for (int i = 0; i < marks.length; i++) {
    if (marks[i] <= 50) {
      less++;
    } else {
      greater++;
    }
  }

  print({'less': less, 'greater': greater});
}