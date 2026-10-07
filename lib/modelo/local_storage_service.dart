import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/modelo/objects/produto.dart';

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
// Chave usada para salvar os favoritos
static const String LISTA_FAVORITOS = "favoritos";

// Salvar somente os IDs dos favoritos
static Future<void> salvarFavoritos(List<Produto> favoritos) async {
  final prefs = await SharedPreferences.getInstance();

  // Pega somente o ID de cada produto
  List<String> ids = favoritos
      .map((produto) => produto.id.toString())
      .toList();

  // Salva os IDs no celular
  await prefs.setStringList(
    LISTA_FAVORITOS,
    ids,
  );
}

// Recuperar somente os IDs dos favoritos
static Future<List<int>> carregarIdsFavoritos() async {
  final prefs = await SharedPreferences.getInstance();

  List<String>? idsSalvos =
      prefs.getStringList(LISTA_FAVORITOS);

  if (idsSalvos == null) {
    return [];
  }

  // Converte os IDs de String para int
  return idsSalvos
      .map((id) => int.parse(id))
      .toList();
}
static Future<void> limparProdutos() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.remove(LISTA_PRODUTOS);
  await prefs.remove(LISTA_FAVORITOS);
}


}
