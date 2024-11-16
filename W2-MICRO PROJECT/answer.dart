
import 'question.dart';

class Answer {
 String
      response; 
  bool isCorrect = false;

  Answer(this.response);

  bool checkAns(Question question) {
    if (question.isMultiple) {
      List<String> selectedAnswers =
          response.split(',').map((e) => e.trim()).toList();
      return question.correctAns
          .every((correctAnswer) => selectedAnswers.contains(correctAnswer));
    } else {
      return question.correctAns.contains(response);
    }
  }

  void updateCorrectness(Question question) {
    isCorrect = checkAns(question);
  }
}
