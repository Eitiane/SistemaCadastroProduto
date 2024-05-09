import 'dart:io';

void main() {
  var cadastro = CadastroProdutosImpl();
  while (true) {
    print('o que você gostaria de fazer? Escolha uma das opções abaixo');
    print('você gostaria cadastrar? Escolha a opçaõ 1');
    print('você gostaria listar? Escolha a opçaõ 2');
    print('você gostaria cadastrar? Escolha a opçaõ 3');
    String? inputOpcao = stdin.readLineSync();
    var opcao = int.parse(inputOpcao!);
    switch (opcao) {
      case 1:
        cadastro.cadastrar();
        break;
    }
  }
}

class Produto {
  int id;
  String nome;
  double preco;
  int quantidade;

  Produto(this.id, this.nome, this.preco, this.quantidade);
}

abstract class CadastroProdutos {
  void cadastrar();

  void listar();

  void buscar();
}

class CadastroProdutosImpl implements CadastroProdutos {
  //List<Produto> produtos [];

  @override
  void cadastrar() {
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
  }

  @override
  void buscar() {}

  @override
  void listar() {}
}
