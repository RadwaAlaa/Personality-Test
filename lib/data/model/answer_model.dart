class Answer {
  String answerText;
  String index;
  String type;
  bool isSelected;

  Answer(
      {required this.answerText,
      required this.index,
      required this.type,
      required this.isSelected});

  static Answer fromJson(Map<String, dynamic> json) {
    return Answer(
        answerText: json['answerText'],
        index: json['index'],
        type: json['type'],
        isSelected: false);
  }
}
