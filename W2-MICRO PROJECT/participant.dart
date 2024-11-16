
import 'answer.dart';
import 'question.dart';

class Participant {
   String firstName; // Use camelCase for variable names
   String lastName;
  List<Answer> answers = [];

  Participant({required this.firstName, required this.lastName});

  void answerQuestion(Question question, String response) {
    Answer answer = Answer(response);
    answer.updateCorrectness(question);
    answers.add(answer);
  }

  int getScore() {
    return answers.where((answer) => answer.isCorrect).length;
  }
}