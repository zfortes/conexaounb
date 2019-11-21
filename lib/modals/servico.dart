class Servico{
  var id;
  String nome;
  String empresa;
  String ndenuncias;

  Servico({
    this.id,
    this.nome,
    this.empresa
  });


  factory Servico.fromJson(Map<String, dynamic> json){
    return new Servico(
      id: json['id'],
      nome: json['nome'],
      empresa: json['empresa']
    );
  }



  factory Servico.fromJsonString(Map<String, dynamic> json){
    return new Servico(
        id: json['id'],
        nome: json['nome'],
        empresa: json['empresa']
    );
  }

  String getNome(){
    return this.nome;
  }

}