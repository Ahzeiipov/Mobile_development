class Question {
  String title;
  bool isMultiple;
  List<String> correctAns;
  List<String> options;

  Question(
      {required this.title,
      required this.correctAns,
      required this.isMultiple,
      required this.options});
}
