import 'dart:io';

void main() {
  var cadastro = CadastroProdutosImpl();
  while (true) {
    print('o que você gostaria de fazer? Escolha uma das opções abaixo');
    print('você gostaria cadastrar? Escolha a opção 1');
    print('você gostaria listar? Escolha a opção 2');
    print('você gostaria buscar? Escolha a opção 3');
    String? inputOpcao = stdin.readLineSync();
    var opcao = int.parse(inputOpcao!);
    switch (opcao) {
      case 1:
        cadastro.cadastrar();
        break;
      case 2:
        cadastro.listar();
        break;
      case 3:
        print('qual é o id do produto?');
        var id = int.parse(stdin.readLineSync()!);
        var produto = cadastro.buscar(id);
        if (produto != null) {
          print(
              'ID: ${produto.id} - Nome: ${produto.nome} - Preço: ${produto.preco} - Quantidade: ${produto.quantidade}');
        } else {
          print('Produto não encontrado.');
        }
        break;
      default:
        print('Opção inválida.');
    }
  }
}

class Produto {
  int id;
  String nome;
  double preco;
  int quantidade;

  Produto(this.id, this.nome, this.preco, this.quantidade);

  @override
  String toString() {
    return 'ID: $id, Nome: $nome, Preço: $preco, Quantidade: $quantidade';
  }
}

abstract class CadastroProdutos {
  void cadastrar();

  void listar();

  Produto? buscar(int id);
}

class CadastroProdutosImpl implements CadastroProdutos {
  List<Produto> produtos = [];

  @override
  Produto? cadastrar() {
    print("Qual é o id do produto (6 algarismo)?");
    String? inputId = stdin.readLineSync();
    if (inputId != null) {
      int id = int.parse(inputId);
      print('o id do produto é $id');
    }
    print("Qual é o nome do produto ?");
    String? inputNome = stdin.readLineSync();
    if (inputNome != null) {
      print('o nome do produto é $inputNome');
    }
    print("Qual é o preço do produto?");
    String? inputPreco = stdin.readLineSync();
    if (inputPreco != null) {
      double preco = double.parse(inputPreco);
      print('o valor do produto é $preco');
    }
    print("Qual é a quantidade do produto?");
    String? inputQuant = stdin.readLineSync();
    if (inputQuant != null) {
      int Quant = int.parse(inputQuant);
      print('o id do produto é $Quant');
    }
    var produto = Produto(id, inputNome ?? "", preco, Quant);
    produtos.add(produto); // Adiciona o produto à lista
    return produto;
  }

  @override
  Produto? buscar(int id) {
    for (var produto in produtos) {
      if (produto.id == id) {
        return produto;
      }
    }
    return null;
  }

  @override
  void listar() {
    for (var produto in produtos) {
      print(
          'ID: ${produto.id} - Nome: ${produto.nome} - Preço: ${produto.preco} - Quantidade: ${produto.quantidade}');
    }
  }
}
