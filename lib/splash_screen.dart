import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // importa o meu main HomePage
import 'package:flutter_application_1/controlador/listaProdutoController.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';
import 'package:flutter_application_1/modelo/api/Sincroniza.dart';
import 'package:flutter_application_1/modelo/objects/produto.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     iniciarApp();
      
  }
  // aqui é o responsavel por carregar os dados antes de abrir a tela principal
    Future<void> iniciarApp() async {
       // Busca os produtos diretamente da API
  Sincroniza api = Sincroniza();

   List<Produto> produtosApi = await api.requestProdutos();

  // Limpa a lista atual
  listaProdutos.clear();

  // Coloca os produtos que vieram da API
  listaProdutos.addAll(produtosApi);

  // Carrega somente os favoritos salvos
 listaFavoritos.clear();

List<int> idsFavoritos =
    await LocalStorageService.carregarIdsFavoritos();

listaFavoritos.addAll(
  produtosApi.where(
    (produto) => idsFavoritos.contains(produto.id),
  ),
);
// Marca como favorito os produtos que já estavam salvos
for (Produto produto in listaProdutos) {
  for (Produto favorito in listaFavoritos) {
    if (produto.id == favorito.id) {
      produto.favorito = true;
    }
  }
}

  await Future.delayed(const Duration(seconds: 3));

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage(),
    ),
  );
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0E4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("imagens/logo.png", width: 300),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFFc65c69)),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
