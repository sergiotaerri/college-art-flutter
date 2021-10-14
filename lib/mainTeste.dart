import 'package:flutter/widgets.dart';
import './dbprovider.dart';
import 'entities/pessoa_entity.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  PessoaDbProvider pessoaDb = PessoaDbProvider();

  final pessoa = PessoaEntity(
    1,
    'nomezao',
    '123.456.789-00',
    'email@email.com',
    'senha123',
  );

  await pessoaDb.addItem(pessoa);
  var pessoas = await pessoaDb.fetchPessoas();
  print(pessoas[0].nome);

  final newpessoa = PessoaEntity(
    pessoa.id,
    'nomezao2',
    '123.456.789-11',
    'email@email.com.br',
    'senha321',
  );

  await pessoaDb.updatePessoa(pessoa.id, newpessoa);
  var updatedpessoas = await pessoaDb.fetchPessoas();
    print(updatedpessoas[0].nome); //Title 1 changed

  await pessoaDb.deletePessoa(pessoa.id);
  print(await pessoaDb.fetchPessoas()); //[]

}