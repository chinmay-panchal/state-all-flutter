import 'dart:convert';

void main() {
  print("hello");
  // output: duplicate number, unique number, unique strings

  String jsonString = '''
  {
    "urls": [
      "https://a.com",
      "https://b.com",
      "https://a.com",
      "https://c.com",
      "https://b.com",
      "https://d.com"
    ]
  }
  ''';

  Map<String, dynamic> data = jsonDecode(jsonString);
  Map<String, int> mapp = {};

  // List<String> urls = List<String>.from(data['urls']);
  List<String> urls = (data['urls'] as List).map((e) => e as String ).toList();

  for (int i = 0; i < urls.length; i++) {
    mapp[urls[i]] = (mapp[urls[i]] ?? 0) + 1;
  }

  int duplicate = 0;
  List<String> uniqueUrls = [];

  mapp.forEach((url, count) {
    if (count > 1) {
      duplicate++;
    } else {
      uniqueUrls.add(url);
    }
  });

  print({
    'duplicate': duplicate,
    'unique': uniqueUrls.length,
    'uniqueURls': uniqueUrls,
  });
}
