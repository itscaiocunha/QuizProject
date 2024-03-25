import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoRresponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoRresponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['resposta']
        : [];
    return Column(children: [
      Questao(
        (perguntas[perguntaSelecionada]['pergunta'].toString()),
      ),
      ...respostas
          .map((resp) => Resposta(
                resp['texto'].toString(),
                () => quandoRresponder(int.parse(resp['pontuacao'].toString())),
              ))
          .toList(),
    ]);
  }
}
