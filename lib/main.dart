import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/dice_screen.dart';
import 'package:flutter_application_3/screens/finished_quiz.dart';
import 'package:flutter_application_3/screens/menu_screen.dart';
import 'package:flutter_application_3/screens/movies_screen.dart';
import 'package:flutter_application_3/screens/personal_card_screen.dart';
import 'package:flutter_application_3/screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MenuScreen.screenName,
      routes: {
        MenuScreen.screenName: (context) => const MenuScreen(),
        PersonalCardScreen.screenName: (context) => const PersonalCardScreen(),
        DiceScreen.screenName: (context) => const DiceScreen(),
        QuizScreen.screenName: (context) => const QuizScreen(),
        // MovieScreen.screenName: (context) => const MovieScreen(),
        FinishedQuizScreen.screenName: (context) => FinishedQuizScreen(
            arguments: ModalRoute.of(context)?.settings.arguments
                as FinishedQuizScreenArguments)
      },
    );
  }
}
