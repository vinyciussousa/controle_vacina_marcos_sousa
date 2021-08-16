// @dart=2.9

import 'dart:convert';
import 'dart:ffi';

import 'package:controle_vacina/model/pessoa.dart';
import 'package:http/http.dart';

import '../web_client.dart';

class PessoaWebClient {
  Future<List<Pessoa>> findAll() async {
    final Response response =
    await client.get(Uri.http(baseUrl, api)).timeout(Duration(seconds:
    5));
    final
    List<dynamic> decodedJson =  jsonDecode(utf8.decode(response.bodyBytes));
    return decodedJson
        .map((dynamic json) => Pessoa.fromJson(json))
        .toList();
  }
  Future<Pessoa> salvar(Pessoa pessoa) async {
    Response response;
    if (pessoa.cpf == null) {
      response = await client.post(Uri.http(baseUrl, api),
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode(pessoa.toJson()));
    } else {
      Uri alterar = Uri.http(baseUrl, api);
      response = await client.post(alterar,
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode(pessoa.toJson()));
    }
    return Pessoa.fromJson(jsonDecode(response.body));
  }
  Future<Void> excluir(int cpf) async {
    Response response;
    Uri deletar = Uri.http(baseUrl, api + "/${cpf}");
    response = await client.delete(deletar, headers: {
      'Content-type': 'application/json',
    });
  }
}
