import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é o maior time de futebol da Bahia',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual a cor do cavalo branco do Napoleão',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    }
  ];

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
    List<String> respostas = temPerguntaSeleciona
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    // for (var textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //   respostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste'),
        ),
        body: temPerguntaSeleciona
            ? Column(children: [
                Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                ...respostas.map((t) => Resposta(t, _responder)).toList(),
              ])
            : null,
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
