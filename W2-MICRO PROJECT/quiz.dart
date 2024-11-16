import 'question.dart';

class Quiz {
  List<Question> questions;
  Quiz(this.questions);

  void addQuestion(Question question) {
    questions.add(question);
  }
}
