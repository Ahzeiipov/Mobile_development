// import 'package:flutter/material.dart';
// import '../model/submission.dart';
// import '../model/answer.dart';
// import '../model/quiz.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen(
//       {super.key,
//       required this.onRestart,
//       required this.quiz,
//       required this.submission});
//   final Submission submission;
//   final Quiz quiz;
//   final VoidCallback onRestart;

//   @override
//   Widget build(BuildContext context) {
//     int score = submission.getScore();
//     // int totalQuestion = quiz.questions.length;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Title(color: Colors.white,
//              child: Text('Your answered $score on ${quiz.questions.length}'),
//              ),

//             ListView.builder(
//               itemCount: quiz.questions.length,
//               itemBuilder: (context , index){

//               }
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
