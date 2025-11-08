class TodoModel {
  final String title;
  final bool isdone;

  TodoModel({required this.title, required this.isdone});

  TodoModel copyWith({String? title, bool? isdone}) {
    return TodoModel(
      title: title ?? this.title,
      isdone: isdone ?? this.isdone,
    );
  }
}
