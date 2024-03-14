import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
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
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              onPressed: responder,
              child: const Text(
                  'É um framework de código aberto criado pelo Google para o desenvolvimento de aplicativos multiplataforma'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text(
                  'É uma linguagem de programação moderna, segura e de alto desempenho'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text(
                  'É um sistema que fornece diretrizes para desenvolvimento de interfaces de usuário consistentes e acessíveis em diferentes plataformas'),
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
