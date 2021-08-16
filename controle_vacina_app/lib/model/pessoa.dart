// @dart=2.9

class Pessoa{
  int cpf;
  String nome;
  String uf;
  String cidade;
  var data;
  String vacina;
  String responsavel;
  var segunda;

  Pessoa(this.cpf, this.nome, this.uf, this.cidade, this.data, this.vacina, this.responsavel, this.segunda);

  Map<String, dynamic> toJson() =>
      {
        "cpf": cpf,
        "cidade": cidade,
        "data": data,
        "nome": nome,
        "responsavel": responsavel,
        "segunda": segunda,
        "uf": uf,
        "vacina": vacina,
      };
  Pessoa.fromJson(Map<String, dynamic> json) :
      cpf = json["cpf"],
      cidade = json["cidade"],
      data = json["data"],
      nome = json["nome"],
      responsavel = json["responsavel"],
      segunda = json["segunda"],
      uf = json["uf"],
      vacina = json["vacina"];

  @override
  String toString() {
    return "CPF: $cpf \n Nome: $nome \n UF: $uf \n Cidade: $cidade \n Data: $data \n Vacina: $vacina \n Responsavel pela aplicação: $responsavel \n Segunda dose: $segunda";
  }
}
