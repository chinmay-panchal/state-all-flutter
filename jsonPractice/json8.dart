import 'dart:convert';

void main() {
  String jsonString = '''{
    "products": [
      {"name": "Laptop", "category": "Electronics"},
      {"name": "Shirt", "category": "Clothing"},
      {"name": "Mobile", "category": "Electronics"},
      {"name": "Pants", "category": "Clothing"},
      {"name": "Book", "category": "Stationery"}
    ]
  }
  ''';

  final data = jsonDecode(jsonString);
  List<Device> productList = (data['products'] as List)
      .map((e) => Device(name: e['name'], category: e['category']))
      .toList();

  Map<String, int> mapp = {};

  productList.forEach((e) {
    mapp[e.category] = (mapp[e.category] ?? 0) + 1;
  });

  print({'category_count': mapp});
}

class Device {
  String name;
  String category;

  Device({required this.name, required this.category});
}
