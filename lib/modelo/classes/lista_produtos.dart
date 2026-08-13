import 'produto.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';



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
List<Produto> listaFavoritos = [];

Future<void> inicializarProdutos(List<Produto> produtos) async {
  List<Produto> lista = await LocalStorageService.carregarProdutos();

  if (lista.isEmpty) {
    await LocalStorageService.salvarProdutos(produtos);
  }

 
}
