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
        {'texto': 'Bahia', 'nota': 10},
        {'texto': 'Vicetória', 'nota': 5},
        {'texto': 'Juazeirense', 'nota': 3},
        {'texto': 'Jacuipense', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual a cor do cavalo branco do Napoleão',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
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
