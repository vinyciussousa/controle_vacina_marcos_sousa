// @dart=2.9

import 'package:controle_vacina/view/lista_pessoa.dart';
import 'package:flutter/material.dart';

import 'http/web_client.dart';

void main() {
  runApp(PessoaApp());
}

class PessoaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaPessoa(),
    );
  }
}
