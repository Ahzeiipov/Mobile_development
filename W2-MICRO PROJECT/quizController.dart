import 'dart:io';
import 'quiz.dart';
import 'question.dart';
import 'participant.dart';

class QuizController {
   Quiz quiz;
   List<Participant> participants = [];

  QuizController(this.quiz);

  void addParticipant(Participant participant) {
    participants.add(participant);
  }

  void startQuiz() {
    for (var participant in participants) {
      print(
          "\n${participant.firstName} ${participant.lastName}, let's start the quiz!");

      for (var question in quiz.questions) {
        print("\nQuestion: ${question.title}");
        for (var i = 0; i < question.options.length; i++) {
          print("${i + 1}. ${question.options[i]}");
        }
        if (question.isMultiple) {
          print('Please input the answer ex(1,2...)');
        } else {
          print('Pleae input answer:');
        }
        var response = stdin.readLineSync();
        if (response != null) {
          participant.answerQuestion(question, response.trim());
        }
      }
    }
  }

  void displayResults() {
    int i = 0;
    for (var participant in participants) {
      print(
          "${i + 1}. ${participant.firstName} ${participant.lastName} and score: ${participant.getScore()}/${quiz.questions.length}");
    }
  }

}
