import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/dice_screen.dart';
import 'package:flutter_application_3/screens/personal_card_screen.dart';
import 'package:flutter_application_3/screens/quiz_screen.dart';

import '../widget/button.dart';
import 'movies_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String screenName = '/menu_screen';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigationToPersonalScreen() =>
        Navigator.pushNamed(context, PersonalCardScreen.screenName);
    navigationToDiceScreen() =>
        Navigator.pushNamed(context, DiceScreen.screenName);
    navigationToQuizScreen() =>
        Navigator.pushNamed(context, QuizScreen.screenName);
    navigationToMovieScreen() =>
        Navigator.pushNamed(context, MoviesScreen.screenName);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Menu Inicial',
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
                width: double.infinity,
              ),
              Button(
                text: 'Cartão pessoal',
                onPressed: navigationToPersonalScreen,
              ),
              const SizedBox(height: 16),
              Button(
                text: 'Tela jogo de dados',
                onPressed: navigationToDiceScreen,
              ),
              const SizedBox(height: 16),
              Button(
                text: 'Quiz',
                onPressed: navigationToQuizScreen,
              ),
              const SizedBox(height: 16),
              Button(
                text: 'Filmes',
                onPressed: navigationToMovieScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
