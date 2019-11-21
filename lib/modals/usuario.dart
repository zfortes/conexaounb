class Usuario{
  String nome;
  String email;

  Usuario({
    this.nome,
    this.email
  });


  factory Usuario.fromJson(Map<String, dynamic> json){
    return new Usuario(
      nome: json['nome'],
      email: json['email']
    );
  }


  String getNome(){return this.nome;}

  String getEmail(){return this.email;}



}