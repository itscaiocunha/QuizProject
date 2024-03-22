import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'pergunta': 'O que é Flutter?',
      'resposta': [
        'É um framework de código fechado criado pela Microsoft para o desenvolvimento de aplicativos multiplataforma',
        'É um framework de código aberto criado pelo Google para o desenvolvimento de aplicativos multiplataforma',
        'É uma linguagem de programação criada pelo Google para o desenvolvimento de sistemas web'
      ]
    },
    {
      'pergunta': 'O que é Dart?',
      'resposta': [
        'É uma linguagem de programação moderna, segura e de alto desempenho',
        'É uma linguagem de programação orientada a objeto de baixo desempenho',
        'É um framework para geração de design mobile e web'
      ]
    },
    {
      'pergunta': 'O que é Material Design?',
      'resposta': [
        'É um sistema que fornece templates prontos para agilidade de desenvolvimento',
        'É um sistema que fornece diretrizes para desenvolvimento de interfaces de usuário consistentes e acessíveis em diferentes plataformas',
        'É um framework de dart para construção de ambientes virtuais'
      ]
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['resposta']
        : [];

    // for (String textoResp in respostas) {
    //   widget.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Widget Inicial
      home: Scaffold(
          //Estrutura da Aplicação
          appBar: AppBar(
              //Identidade da Aplicação
              title: const Text('Quiz')),
          body: temPerguntaSelecionada
              ? Column(
                  children: [
                    Questao(
                      (_perguntas[_perguntaSelecionada]['pergunta'].toString()),
                    ),
                    ...respostas.map((t) => Resposta(t, _responder)),
                  ],
                )
              : Resultado()),
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
