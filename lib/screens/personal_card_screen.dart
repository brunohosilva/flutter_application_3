import 'package:flutter/material.dart';

class PersonalCardScreen extends StatelessWidget {
  static const String screenName = '/personal_card_screen';

  const PersonalCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cartão Pessoal')),
      backgroundColor: Colors.greenAccent,
      body: const SafeArea(
          child: Center(
        child: Text('Cartao pessoal'),
      )),
    );
  }
}
