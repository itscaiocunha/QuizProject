import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'O que é Flutter?',
      'resposta': [
        {
          'texto':
              'É um framework de código fechado criado pela Microsoft para o desenvolvimento de websites',
          'pontuacao': 0,
        },
        {
          'texto':
              'É um framework de código aberto criado pelo Google para o desenvolvimento de aplicativos multiplataforma',
          'pontuacao': 10,
        },
        {
          'texto':
              'É uma linguagem de programação criada pelo Google para o desenvolvimento de IA',
          'pontuacao': 0,
        }
      ]
    },
    {
      'pergunta': 'O que é Dart?',
      'resposta': [
        {
          'texto':
              'É uma linguagem de programação moderna, segura e de alto desempenho',
          'pontuacao': 10,
        },
        {
          'texto':
              'É uma linguagem de programação orientada a objeto de baixo desempenho',
          'pontuacao': 0,
        },
        {
          'texto': 'É um framework para geração de design mobile e web',
          'pontuacao': 0,
        }
      ]
    },
    {
      'pergunta': 'O que é Material Design?',
      'resposta': [
        {
          'texto':
              'É um sistema que fornece diretrizes para desenvolvimento de interfaces de usuário consistentes e acessíveis em diferentes plataformas',
          'pontuacao': 10,
        },
        {
          'texto':
              'É um framework de dart para construção de ambientes virtuais',
          'pontuacao': 0,
        },
        {
          'texto':
              'É um sistema que fornece templates prontos para agilidade de desenvolvimento',
          'pontuacao': 0,
        },
      ]
    },
    {
      'pergunta': 'O que é Splash?',
      'resposta': [
        {
          'texto': 'Não é de flutter',
          'pontuacao': 0,
        },
        {
          'texto': 'Elemento gráfico de uma janela contendo apenas texto',
          'pontuacao': 0,
        },
        {
          'texto':
              'Elemento de controle gráfico que consiste em uma janela contendo uma imagem, um logotipo e a versão atual do software',
          'pontuacao': 10,
        },
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // for (String textoResp in respostas) {
    //   widget.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Widget Inicial
      home: Scaffold(
          //Estrutura da Aplicação
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Quiz'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoRresponder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuiz)),
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
