import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int randomDiceNumber = 1;

  void randomDice1() {
    randomDiceNumber = Random().nextInt(6) + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: randomDice1,
        child: Image(
          image: AssetImage('assets/images/dice$randomDiceNumber.png'),
        ),
      ),
    );
  }
}
