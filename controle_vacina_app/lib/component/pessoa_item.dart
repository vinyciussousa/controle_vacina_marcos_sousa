// @dart=2.9

import 'package:controle_vacina/model/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaItem extends StatelessWidget {
  final Pessoa _pessoa;
  PessoaItem(this._pessoa);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.blue,
        child: Column(
          children: [
            ListTile(
              title: Text(
                _pessoa.cpf.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.nome,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.uf,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.cidade,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.data,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.vacina,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.responsavel,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _pessoa.segunda,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
