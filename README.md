Crie um sistema simples de cadastro de produtos que permita adicionar, listar e buscar produtos. Utilize classes para representar os produtos, funções para realizar as operações e estruturas de controle para interagir com o usuário. O sistema deve ter as seguintes funcionalidades:

Classe Produto: Representa um produto com os seguintes atributos: id (int), nome (String), preco (double) e quantidade (int).
Classe abstrata CadastroProdutos: Define os métodos abstratos cadastrar, listar e buscar.
Classe CadastroProdutosImpl: Implementa a classe abstrata CadastroProdutos, utilizando uma lista para armazenar os produtos e implementando os métodos cadastrar, listar e buscar.
Função main: Implementa um menu interativo com as opções de cadastrar um novo produto, listar todos os produtos e buscar um produto pelo id. Use estruturas de repetição (while) e estruturas condicionais (if/else) para controlar o fluxo do programa.
Utilize a função stdin.readLineSync() para ler a entrada do usuário e realizar as operações.