// @dart=2.9

import 'package:controle_vacina/component/cria_dropdown.dart';
import 'package:controle_vacina/component/cria_textfield.dart';
import 'package:controle_vacina/http/webclient/pessoa_webclient.dart';
import 'package:controle_vacina/model/pessoa.dart';
import 'package:controle_vacina/view/lista_pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroPessoa extends StatefulWidget {
  @override
  _CadastroPessoaState createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _ufController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _vacinaController = TextEditingController();
  TextEditingController _responsavelController = TextEditingController();
  TextEditingController _segundaController = TextEditingController();

  PessoaWebClient _pessoaWebClient = PessoaWebClient();

  var _vacina = ["PFIZER", "BUTANTAN", "ASTRAZENECA"];
  var _vacinaAplicada = "PFIZER";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _alterarVacina(String novaVacinaAplicada) {
    _dropDownVacinaAplicada(novaVacinaAplicada);
    setState(() {
      this._vacinaAplicada = novaVacinaAplicada;
      _vacinaController.text = this._vacinaAplicada;
    });
  }

  _dropDownVacinaAplicada(String novaVacina) {
    setState(() {
      this._vacinaAplicada = novaVacina;
    });
  }

  _displaySnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _salvar(BuildContext context) {
    Pessoa pessoa = Pessoa(
        int.parse(_cpfController.text),
        _nomeController.text,
        _ufController.text,
        _cidadeController.text,
        _dataController.text,
        _vacinaAplicada,
        _responsavelController.text,
        _segundaController.text
    );
    setState(() {
      _pessoaWebClient.salvar(pessoa).then((res) {
        setState(() {
          _displaySnackBar(context, res.toString());
/*Navigator.push(
context,
MaterialPageRoute(builder: (context) => ListaPessoa()),
);*/
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ficha de Vacinação"),
        centerTitle: true,
        leading: new IconButton(
          icon: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaPessoa()),
              );
            },
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField("CPF", _cpfController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField("Nome", _nomeController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField("UF", _ufController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField(
                  "Cidade", _cidadeController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField("Data", _dataController, TextInputType.text),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Text(
                    "Vacina",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: criaDropDownButton(
                        _vacina, _alterarVacina, _vacinaAplicada),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField("Responsavel pela Aplicação",
                  _responsavelController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: criaTextField(
                  "Segunda Dose", _segundaController, TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _salvar(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPrimary: Colors.green,
                  ),
                  label: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
