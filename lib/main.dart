import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é o maior time de futebol da Bahia',
      'respostas': [
        {'texto': 'Bahia', 'pontuacao': 10},
        {'texto': 'Vicetória', 'pontuacao': 5},
        {'texto': 'Juazeirense', 'pontuacao': 3},
        {'texto': 'Jacuipense', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual a cor do cavalo branco do Napoleão',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    }
  ];

  final textoResultado = 'Parabéns';

  void _responder() {
    if (temPerguntaSeleciona) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSeleciona {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste'),
        ),
        body: temPerguntaSeleciona
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(textoResultado),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
