import 'package:flutter/material.dart';
import '../model/submission.dart';
import '../model/answer.dart';
import '../model/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.quiz,
    required this.submission,
  });

  final Submission submission;
  final Quiz quiz;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();
    int totalQuestions = quiz.questions.length;

    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score / $totalQuestions',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final userAnswer = submission.getAnswerFor(question);
                  final isCorrect = userAnswer?.isCorrect(question) ?? false;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: isCorrect ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${index + 1}. ${question.title}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            isCorrect ? Icons.check : Icons.close,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[500],
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
