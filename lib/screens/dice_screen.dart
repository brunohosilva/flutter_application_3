import 'package:flutter/material.dart';

import '../widget/dice.dart';

class DiceScreen extends StatefulWidget {
  static const String screenName = '/dice_screen';

  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Dice(),
                    SizedBox(width: 20),
                    Dice(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
