import 'quiz.dart';

class Answer {
  String questionAnswer;
  Answer(this.questionAnswer);
}

bool isCorrect(Question questions, Answer answer) {
  return questions.goodAnswer == answer.questionAnswer;
}
