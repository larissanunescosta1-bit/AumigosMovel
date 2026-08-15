import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/modelo/classes/produto.dart';

class LocalStorageService {
  //Constantes que indical a chava shared em que o dado será presistido
  static const String LISTA_PRODUTOS = 'lista_produtos';

  // Salvar a lista
  static Future<void> salvarProdutos( List<Produto> lista) async {
    //instancia a classe sp
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //converte a lista de produtos em string
    final String encodedData = Produto.encode(lista);
    //Persiste o dadop
    await prefs.setString(LISTA_PRODUTOS, encodedData);
  }

  // Recuperar a lista
  static Future<List<Produto>> carregarProdutos() async {

    //  acesso ao armazenamento.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? produtosJson = prefs.getString(LISTA_PRODUTOS);

    if (produtosJson == null) return [];

    //RETORNA LISTA DE PRODUTOS
    return Produto.decode(produtosJson);
  }

// e como se fosse uma chave que é usada para identificar onde os favoritos serão salvos
static const String LISTA_FAVORITOS = "favoritos";

static Future<void> salvarFavoritos(List<Produto> favoritos) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString(
    LISTA_FAVORITOS,
    Produto.encode(favoritos),
  );
}

static Future<List<Produto>> carregarFavoritos() async {
  final prefs = await SharedPreferences.getInstance();
 // busca os favoritos salvos usando a chave LISTA_FAVORITOS
  String? json = prefs.getString(LISTA_FAVORITOS);

  if (json == null) {
    return [];
  }

  return Produto.decode(json);
}



}
