import 'dart:io';

class Participant {
  String last_name;
  String first_name;
  int score;

  Participant(
      {required this.first_name, required this.last_name, this.score = 0});
}

class Question {
  String title;
  List<String> options;
  List<int> CorrectAns;
  bool MultipleChoice;
  Question(
      {required this.title,
      required this.options,
      required this.CorrectAns,
      required this.MultipleChoice});
  List<String> get correctAnswerTexts =>
      CorrectAns.map((index) => options[index]).toList();
}

void displayQuestion(Question question) {
  print(question.title);
  for (int i = 0; i < question.options.length; i++) {
    print('${i + 1}. ${question.options[i]}'); // Corrected to show the option
  }
}

List<int> getUserSelected(Question question) {
  List<int> Userselected = [];
  if (question.MultipleChoice) {
    print("please input the answer ex 1,2,3");
    String input = stdin.readLineSync() ?? ' ';
    Userselected = input
        .split(',')
        .map((e) => int.tryParse(e.trim()) ?? -1)
        .where((index) => index != -1 && index - 1 < question.options.length)
        .map((index) => index - 1)
        .toList();
  } else {
    print('please input your answer :');
    String input = stdin.readLineSync() ?? ' ';
    // ah  nes covert any data type 
    int selectedOption = int.tryParse(input) ?? -1;
    if (selectedOption > 0 && selectedOption <= question.options.length) {
      Userselected.add(selectedOption - 1);
      // hold ah value ng pel select is pel user input ey del ot mean in ng so it hold -1 
    }
  }
  return Userselected;
}

bool selectCorrectAnswer(List<int> selectedOptions, List<int> correctAnswers,
    bool isMultipleChoice) {
  if (isMultipleChoice) {
    // For multiple choice questions, check if selected options match the correct answers
    return correctAnswers.toSet().difference(selectedOptions.toSet()).isEmpty &&
        selectedOptions.toSet().difference(correctAnswers.toSet()).isEmpty;
  } else {
    // For single choice questions, check if the single selected option matches the correct answer
    return selectedOptions.length == 1 &&
        selectedOptions[0] == correctAnswers[0];
  }
}

void Displayscore(Participant student, int Totalquestion) {
  print('your score is ${student.score} our of ${Totalquestion} .');
}

void Correctionfeedback(
    bool iscorrect, Question questions, List<int> SelectedOptions) {
  if (iscorrect) {
    print('-----------------');
    print('your answer is correct ');
    print('-----------------');
  } else {
    print('-----------------');
    print('incorrect answer');
    print('-----------------');
    print(
        'Here is correct answer:  ${questions.correctAnswerTexts.join(', ')}');
    print('-----------------');
  }
}

void displayParticipants(List<Participant> participants) {
  print('-----------------');
  print('List of participants and their scores:');
  print('-----------------');

  for (var participant in participants) {
    print('-----------------');

    print(
        'Result ${participant.first_name} ${participant.last_name}: ${participant.score}');
    print('-----------------');
  }
}

void main() {
  List<Question> qeustions = [
    Question(
        title: 'what is 2+2',
        options: ['3', '5', '6', '4'],
        CorrectAns: [3],
        MultipleChoice: false),
    Question(
        title: 'What is 5x5 ?',
        options: ['10', '25', '30', '40'],
        CorrectAns: [1],
        MultipleChoice: false),
    Question(
        title: 'Which of the following is classified as a fruit?',
        options: ['Bana', 'Brocoli', 'Apple', 'Carrot'],
        CorrectAns: [0, 2],
        MultipleChoice: true)
  ];
  List<Participant> users = [];
  while (true) {
    print('Please input your first name:');
    String firstName = stdin.readLineSync() ?? ' ';
    print('Please input your last name:');
    String lastName = stdin.readLineSync() ?? ' ';
    Participant user = Participant(first_name: firstName, last_name: lastName);
    for (var question in qeustions) {
      displayQuestion(question);
      List<int> selectedOptions = getUserSelected(question);
      bool iscorrect = selectCorrectAnswer(
          selectedOptions, question.CorrectAns, question.MultipleChoice);
      Correctionfeedback(iscorrect, question, selectedOptions);
      if (iscorrect) {
        user.score++;
      }
    }
    Displayscore(user, qeustions.length);
    users.add(user);
    print('-----------------');
    print('Do you want to add another participant ? (yes/no)');
    print('-----------------');

    String input = stdin.readLineSync() ?? ' ';
    if (input.toLowerCase() != 'yes') {
      break;
    }
  }
  displayParticipants(users);
}
