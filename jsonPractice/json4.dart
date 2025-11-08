import 'dart:convert';

void main() {
  String jsonString = '''
  {
    "words": ["apple", "banana", "apple", "banana", "orange"]
  }
  ''';

  final data = jsonDecode(jsonString);
  Map<String, int> frequencies = {};

  (data['words'] as List).map((e) {
    frequencies[e as String] = (frequencies[e] ?? 0) + 1;
    return e;
  }).toList();

  int maxfreq = 0;
  frequencies.forEach((fruit, count) {
    if (count > maxfreq) {
      maxfreq = count;
    }
  });

  List<String> most_frequent = [];

  frequencies.forEach((fruit, count) {
    if (count == maxfreq) {
      most_frequent.add(fruit);
    }
  });

  print({'frequencies': frequencies, 'most_frequent': most_frequent});
}
