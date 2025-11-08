import 'dart:convert';

void main() {
  String jsonString = '''{
      "numbers": [10, 25, 50, 5, 90, 40]
    }''';

  Map<String, dynamic> data = jsonDecode(jsonString);
  List<int> numbers = (data['numbers'] as List).map((e) => e as int).toList();

  int max = numbers[0];
  int min = numbers[0];
  int sum = 0;

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > max) {
      max = numbers[i];
    } else if (numbers[i] <= min) {
      min = numbers[i];
    }
    sum += numbers[i];
  }

  print({
    'min':min,
    'max':max,
    'avg': sum/numbers.length
  });
}
