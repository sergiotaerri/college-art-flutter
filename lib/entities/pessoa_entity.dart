class PessoaEntity {
  int ?id;
  String nome = "";
  String cpf = "";
  String email = "";
  String senha = "";

  PessoaEntity(this.id, this.nome, this.cpf, this.email, this.senha);
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "nome": nome,
      "cpf": cpf,
      "email": email,
      "senha": senha,
    };
  }
}