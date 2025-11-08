import 'dart:convert';

void main() {
  String jsonString = '''{
  "transactions": [
    {"id": 1, "amount": 100, "type": "credit"},
    {"id": 2, "amount": 50, "type": "debit"},
    {"id": 3, "amount": 200, "type": "credit"},
    {"id": 4, "amount": 75, "type": "debit"}
  ]
  }''';

  final data = jsonDecode(jsonString);
  List<Transactions> transactions = [];

  transactions = (data['transactions'] as List)
      .map(
        (e) => Transactions(id: e['id'], amount: e['amount'], type: e['type']),
      )
      .toList();

  int balance = 0;
  for (int i = 0; i < transactions.length; i++) {
    if (transactions[i].type == 'credit') {
      balance += transactions[i].amount;
    } else {
      balance -= transactions[i].amount;
    }
  }

  print({'net_balance': balance});
}

class Transactions {
  int id;
  int amount;
  String type;

  Transactions({required this.id, required this.amount, required this.type});
}
