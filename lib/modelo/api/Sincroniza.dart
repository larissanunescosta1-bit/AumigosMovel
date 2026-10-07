import 'package:dio/dio.dart';
import '../objects/produto.dart';

class Sincroniza {
  static String LISTAGEM_PRODUTOS = "https://aumigoswebteste.wasmer.app/api/produtos";

  // Busca os produtos na API
  Future<List<Produto>> requestProdutos() async {
    final dio = Dio();

    final resposta = await dio.get(LISTAGEM_PRODUTOS);

    // Lista que vai guardar os produtos
    List<Produto> produtos = [];

    // Percorre os produtos recebidos da API
    for (var item in resposta.data) {
      produtos.add(Produto.fromMap(item));
    }

    return produtos;
  }
}
