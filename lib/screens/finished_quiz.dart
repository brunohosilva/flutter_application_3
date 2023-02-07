import 'package:flutter/material.dart';

class FinishedQuizScreenArguments {
  FinishedQuizScreenArguments({
    required this.score,
  });

  int score;
}

class FinishedQuizScreen extends StatelessWidget {
  static const String screenName = '/finished_quiz_screen';

  const FinishedQuizScreen({Key? key, required this.arguments})
      : super(key: key);

  final FinishedQuizScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    print(arguments);

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sua pontuação foi de: ${arguments.score}',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ));
  }
}
