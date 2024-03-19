import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'O que é Flutter?',
      'O que é Dart?',
      'O que é Material Design?'
    ];

    return MaterialApp(
      //Widget Inicial
      home: Scaffold(
        //Estrutura da Aplicação
        appBar: AppBar(
            //Identidade da Aplicação
            title: const Text('Quiz')),
        body: Column(
          children: [
            Questao(
              (perguntas[_perguntaSelecionada]),
            ),
            Resposta(
                'É um framework de código aberto criado pelo Google para o desenvolvimento de aplicativos multiplataforma',
                _responder),
            Resposta(
                'É uma linguagem de programação moderna, segura e de alto desempenho',
                _responder),
            Resposta(
                'É um sistema que fornece diretrizes para desenvolvimento de interfaces de usuário consistentes e acessíveis em diferentes plataformas',
                _responder)
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
