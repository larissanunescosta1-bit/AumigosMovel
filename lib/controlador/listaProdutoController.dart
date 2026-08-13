import 'package:flutter_application_1/modelo/classes/produto.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';

/**
 * Classe controle responsável por gerenciar a persistência de produtos.
 * aqui serão encontrados todos os métodos responsáveis por gerenciar a
 * listagem persistida de produtos
 */
class ListaProdutoController{
//peguei do modelo do paim
  static Future<void> inserirProduto(int id, String nome, double preco, String imagem,
  String descricao,) async{
    //busco lista persistida
    List<Produto> lista =  await LocalStorageService.carregarProdutos();
    //inserindo produto na lista (voátil)
    lista.add(new Produto(id: id, nome: nome, preco: preco , imagem: imagem,
      descricao: descricao,));
    //salvando produto na lista persistida
    await LocalStorageService.salvarProdutos(lista);
  }

static Future<void> inicializarProdutos(List<Produto> produtos) async {
  List<Produto> lista = await LocalStorageService.carregarProdutos();

  if (lista.isEmpty) {
    await LocalStorageService.salvarProdutos(produtos);
  }
}


  static Future <void> buscarProduto(int id) async{
    //...
  }

  static Future<List<Produto>> listarProdutos() async{
    //busca listagem persistida
    return await LocalStorageService.carregarProdutos();
  }
}