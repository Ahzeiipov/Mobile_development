import 'dart:io';

class Question {
  String title;
  List<String> options;
  List<int> indexCorrect;
  bool MultipleChoices;
  Question(
      {required this.title,
      required this.options,
      required this.indexCorrect,
      required this.MultipleChoices});
  //  get the correct answer
  List<String> get CorrectAnswer =>
      indexCorrect.map((index) => options[index]).toList();
}

class participant {
  String firstName;
  String LastName;
  int score = 0;
  participant({required this.firstName, required this.LastName});
}

// multiplechoices question allows multiple correct answers (true) or just one (false)
bool SelectCorrectAnswer(
    List<int> selectOption, List<int> indexCorrect, bool isMultipleChoices) {
  if (isMultipleChoices) {
    //   check the select options

    return indexCorrect.toSet().difference(selectOption.toSet()).isEmpty &&
        selectOption.toSet().difference(indexCorrect.toSet()).isEmpty;
  } else {
    return selectOption.length == 1 && selectOption[0] == indexCorrect[0];
  }
}

void main() {
  List<Question> question = [
    Question(
        title: "what is 2+2 ",
        options: ['2', '4', '5', '6'],
        indexCorrect: [1],
        MultipleChoices: false),
    Question(
        title: 'Which of the following are programming languages?',
        options: ['Python', 'HTML', 'Java', 'CSS'],
        indexCorrect: [0, 2],
        MultipleChoices: true),
  ];
  List<participant> users = [];
  while (true) {
    print("plese input your first name:");

    String firstName = stdin.readLineSync() ?? '';
    print("please input last Name: ");
    String lastname = stdin.readLineSync() ?? ' ';

    participant user = participant(firstName: firstName, LastName: lastname);
    int score = 0;

    //  loop each question
    for (var question in question) {
      print(question.title);
      for (int i = 0; i < question.options.length; i++) {
        print('${i + 1}:${question.options[i]}');
      }
      List<int> selectOptions = [];
      if (question.MultipleChoices) {
        print("please input the correct option by (ex: 1,2..)");
        String input = stdin.readLineSync() ?? ' ';
        selectOptions = input
            .split(',')
            .map((e) => int.tryParse(e.trim()) ?? -1)
            .where(
                (index) => index != -1 && index - 1 < question.options.length)
            .map((index) => index - 1)
            .toList();
      } else {
        print('Enter the number of your answer:');
        String input = stdin.readLineSync() ?? '';
        int selectedOption = int.tryParse(input) ?? -1;
        if (selectedOption > 0 && selectedOption <= question.options.length) {
          selectOptions.add(selectedOption - 1);
        }
      }
      if (SelectCorrectAnswer(
          selectOptions, question.indexCorrect, question.MultipleChoices)) {
        print("correct");
        score++;
      } else {
        print("incorrect! The answer is : ${question.CorrectAnswer}");
      }
      print("------------");
    }
    user.score = score;
    users.add(user);
    print('Your final score is $score out of ${question.length}.');
    print('---');

    print('Do you want to add another participant? (yes/no)');
    if (stdin.readLineSync()?.toLowerCase() != 'yes') break;
  }
  print('Participants and their scores:');
  for (var participant in users) {
    print(
        '${participant.firstName} ${participant.LastName}: ${participant.score}');
  }
}
