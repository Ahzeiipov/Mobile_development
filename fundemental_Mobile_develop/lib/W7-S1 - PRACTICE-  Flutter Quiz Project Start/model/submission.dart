import 'quiz.dart';
import 'answer.dart';

class Submission {
  final Map<Question, Answer> answers = {};

  void addAnswer(Question question, String answer) {
    answers[question] == Answer(answer);
  }

  void removeAnswer() {
    answers.clear();
  }

  int getScore() {
    return answers.entries
        .where((entry) => entry.value.isCorrect(entry.key))
        .length;
  }

  Answer? getAnswerFor(Question question) {
    return answers[question];
  }
}
