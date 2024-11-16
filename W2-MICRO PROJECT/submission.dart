
import 'answer.dart';
import 'participant.dart';

class Submission {
   Participant participant;
   List<Answer> answers;

  Submission(this.participant, this.answers);

  int calculateScore() {
    return answers.where((answer) => answer.isCorrect).length;
  }
}