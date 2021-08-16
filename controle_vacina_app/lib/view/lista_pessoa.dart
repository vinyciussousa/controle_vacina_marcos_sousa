// @dart=2.9
import 'package:controle_vacina/component/pessoa_item.dart';
import 'package:controle_vacina/http/web_client.dart';
import 'package:controle_vacina/http/webclient/pessoa_webclient.dart';
import 'package:controle_vacina/model/pessoa.dart';
import 'package:controle_vacina/view/busca_pessoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cadastra_pessoa.dart';

class ListaPessoa extends StatefulWidget {
  @override
  _ListaPessoaState createState() => _ListaPessoaState();
}

class _ListaPessoaState extends State<ListaPessoa> {
  List<Pessoa> _listaPessoas = [];

  PessoaWebClient _pessoaWebClient = PessoaWebClient();

  @override
  void initState() {
    super.initState();
    _pessoaWebClient.findAll().then((dados) {
      setState(() {
        _listaPessoas = dados;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pessoas Vacinadas"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => BuscaPessoa(),
                  ),
                );
              },
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<Pessoa>>(
        initialData: _listaPessoas,
        future: _pessoaWebClient.findAll(),
// ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Pessoa> pessoas = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Pessoa pessoa = pessoas[index];
                  return PessoaItem(pessoa);
                },
                itemCount: pessoas.length,
              );
              break;
          }
          return Text("Erro");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CadastroPessoa(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
