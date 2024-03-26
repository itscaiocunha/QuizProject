import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuiz;

  Resultado(
    this.pontuacao,
    this.quandoReiniciarQuiz,
  );

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Você não acertou nenhuma!';
    } else if (pontuacao < 20) {
      return 'Parabéns! Acertou 1';
    } else if (pontuacao < 30) {
      return 'Parabéns! Acertou 2';
    } else if (pontuacao < 40) {
      return 'Parabéns! Acertou 3';
    } else {
      return 'Mestre Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: const TextStyle(fontSize: 28)),
        ),
        TextButton(
          onPressed: quandoReiniciarQuiz,
          child: const Text('Reiniciar'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
