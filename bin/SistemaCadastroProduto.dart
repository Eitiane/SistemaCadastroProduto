import 'dart:io';

void main() {
  var cadastro = CadastroProdutosImpl();
  //menu de opção
  while (true) {
    print('o que você gostaria de fazer? Escolha uma das opções abaixo');
    print('você gostaria cadastrar? Escolha a opção 1');
    print('você gostaria listar? Escolha a opção 2');
    print('você gostaria buscar? Escolha a opção 3');
    print('você gostaria remover? Escolha a opção 4');
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
      case 4:
        print('qual é o produto que gostaria de remover?');
        var idRemover = int.parse(stdin.readLineSync()!);
        var produtoRemovido = cadastro.remover(idRemover);
        if (produtoRemovido != null) {
          print('Produto removido com sucesso: ${produtoRemovido.nome}');
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

  Produto? remover(int id);
}

class CadastroProdutosImpl implements CadastroProdutos {
  List<Produto> produtos = [];
// função para receber dados do produto e cadastrar
  @override
  Produto? cadastrar() {
    print("Qual é o id do produto (6 algarismo)?");
    String? inputId = stdin.readLineSync();
    int id = int.parse(inputId!);
    print("Qual é o nome do produto ?");
    String? inputNome = stdin.readLineSync()!;
    print("Qual é o preço do produto?");
    double preco = double.parse(stdin.readLineSync()!);
    print("Qual é a quantidade do produto?");
    int Quant = int.parse(stdin.readLineSync()!);

    var produto = Produto(id, inputNome  , preco, Quant);
    produtos.add(produto);
    return produto;
  }
// função para buscar produto via id
  @override
  Produto? buscar(int id) {
    for (var produto in produtos) {
      if (produto.id == id) {
        return produto;
      }
    }
    return null;
  }
// função de listar produtos
  @override
  void listar() {
    if (produtos.isEmpty) {
      print('Nenhum produto cadastrado.');
    } else {
      print('Listando produtos:');
      for (var produto in produtos) {
        print(
            'ID: ${produto.id} - Nome: ${produto.nome} - Preço: ${produto
                .preco} - Quantidade: ${produto.quantidade}');
      }
    }
  }
// função de remover produtos
  Produto? remover(int id) {
    var produtoRemovido;
    for (var produto in produtos) {
      if (produto.id == id) {
        produtoRemovido = produto;
        break;
      }
    }
    if (produtoRemovido != null) {
      produtos.remove(produtoRemovido);
      return produtoRemovido;
    } else {
      return null;
    }
  }
}
