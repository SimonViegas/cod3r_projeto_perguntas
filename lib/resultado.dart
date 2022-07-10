import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String texto;
  const Resultado(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
