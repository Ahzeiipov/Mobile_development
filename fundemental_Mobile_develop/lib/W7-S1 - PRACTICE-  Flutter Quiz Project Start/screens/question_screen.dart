import 'package:flutter/material.dart';
import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final VoidCallback onTap;
  final Question question;
  const QuestionScreen(
      {super.key, required this.question, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Title(
                color: Colors.white,
                child: Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ))),
        const SizedBox(
          height: 10,
        ),
        ...question.possibleAnswers.map(
          (answers) => Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 86, 177, 250),
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  answers,
                  style: const TextStyle(color: Colors.white),
                )),
          ),
        )
      ],
    );
  }
}
