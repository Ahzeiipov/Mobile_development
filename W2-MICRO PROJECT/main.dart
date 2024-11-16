import 'dart:io';

import 'quiz.dart';
import 'question.dart';
import 'answer.dart';
import 'participant.dart';
import 'quizcontroller.dart';

void main() {
  // Sample questions and answers
  var questions = [
    Question(
      title: 'What is the capital of France?',
      correctAns: ['Paris'],
      isMultiple: false,
      options: ['Paris', 'Berlin', 'Madrid'],
    ),
    Question(
      title: 'what is 2+3:',
      correctAns: ['4'],
      isMultiple: false,
      options: ['2', '1', '4', '5'],
    ),
    Question(
      title: 'Select the fruits:',
      correctAns: ['Apple', 'Banana'],
      isMultiple: true,
      options: ['Apple', 'Carrot', 'Banana', 'Broccoli'],
    ),
  ];

  var quiz = Quiz(questions);
  var quizController = QuizController(quiz);

  print('Please Input your first name:');
  String firstname = stdin.readLineSync() ?? '';
  print('Please input you last name');
  String lastname = stdin.readLineSync() ?? '';
  Participant participant =
      Participant(firstName: firstname, lastName: lastname);
  quizController.addParticipant(participant);

  // Start the quiz
  quizController.startQuiz();

  print('-----------------------------------------');
  print('List of participants and their scores:');
  print('-----------------------------------------');
  quizController.displayResults();
}
