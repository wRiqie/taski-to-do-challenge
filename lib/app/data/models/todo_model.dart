class TodoModel {
  final String id;
  final String title;
  final String description;
  final bool isChecked;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    this.isChecked = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isChecked': isChecked ? 1 : 0,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isChecked: map['isChecked'] == 1,
    );
  }
}
