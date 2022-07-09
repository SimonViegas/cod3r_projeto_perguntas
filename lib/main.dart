import 'package:flutter/material.dart';
import './questao.dart';

void main() => runApp(const PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é o maior time de futebol da Bahia',
      'Qual a cor do cavalo branco do Napoleão',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste'),
        ),
        body: Column(children: [
          Questao(perguntas[_perguntaSelecionada]),
          ElevatedButton(
            onPressed: _responder,
            child: const Text('Resposta 1'),
          ),
          ElevatedButton(
            onPressed: _responder,
            child: const Text('Resposta 2'),
          ),
          ElevatedButton(
            onPressed: _responder,
            child: const Text('Resposta 3'),
          ),
        ]),
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
