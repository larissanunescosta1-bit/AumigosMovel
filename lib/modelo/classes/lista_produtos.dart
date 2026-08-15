import 'produto.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';


// lista inicial de produtos do aplicativo
List<Produto> listaProdutos = [
  Produto(
    id: 1,
    nome: "Bandana",
    preco: 30,
    imagem: "imagens/bandana.png",
    descricao: "Bandana com detalhes. TAM: Médio",
  ),

  Produto(
    id: 2,
    nome: "Roupinha",
    preco: 50,
    imagem: "imagens/roupinha.png",
    descricao: "Jardineira mais fofa. TAM: Pequeno",
  ),

  Produto(
    id: 3,
    nome: "Lacinho Rosa",
    preco: 10,
    imagem: "imagens/lacinhoRosa.png",
    descricao: "O lacinho mais fofo. TAM: Pequeno",
  ),
];
// lista que armazena somente os produtos que foram favoritados
List<Produto> listaFavoritos = [];
// innicializa a lista dos produtos verificando se já existem produtos salvos
Future<void> inicializarProdutos(List<Produto> produtos) async {
  // carrega do armazenamento os produtos que já foram salvos
  List<Produto> lista = await LocalStorageService.carregarProdutos();

  if (lista.isEmpty) {
    await LocalStorageService.salvarProdutos(produtos);
  }

 
}
