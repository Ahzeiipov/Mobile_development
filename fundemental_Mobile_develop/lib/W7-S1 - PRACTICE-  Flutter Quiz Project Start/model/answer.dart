import 'quiz.dart';

class Answer {
  String questionAnswer;
  Answer(this.questionAnswer);

  bool isCorrect(Question questions) {
    return questions.goodAnswer == questionAnswer;
  }
}
