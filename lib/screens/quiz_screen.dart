import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/finished_quiz.dart';
import 'package:flutter_application_3/widget/question_button.dart';

class QuestionModel {
  QuestionModel({
    required this.question,
    required this.options,
    required this.anwser,
  });

  String question;
  List<String> options;
  int anwser;
}

class QuizScreen extends StatefulWidget {
  static const String screenName = '/quiz_screen';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];
  var questionIndex = 0;
  var score = 0;

  List<QuestionModel> loadQuestions() {
    return [
      QuestionModel(
          question: "Quantas vezes o Brasil foi capeão da Copa do mundo?",
          options: ['1', '2', '3', '4', '5'],
          anwser: 4),
      QuestionModel(
          question: "Palmeiras tem mundial?",
          options: ['Sim', 'Não'],
          anwser: 1),
    ];
  }

  void optionPressed(int selectedQuestion) {
    final currentQuestion = questions[questionIndex];
    if (selectedQuestion == currentQuestion.anwser) {
      score++;
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (questionIndex == questions.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        FinishedQuizScreen.screenName,
        arguments: FinishedQuizScreenArguments(score: score),
      );
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    questions = loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    String questionText = currentQuestion.question;

    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  return QuestionButton(
                    text: currentQuestion.options[index],
                    onPressed: () => optionPressed(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
