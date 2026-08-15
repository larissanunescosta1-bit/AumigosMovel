import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // importa o meu main HomePage
import 'package:flutter_application_1/controlador/listaProdutoController.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';
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
      // ve  se já existem produtos salvos e caso nao existam os produtos iniciais sao salvos
  await ListaProdutoController.inicializarProdutos(listaProdutos);
  // limpa a lista que esta agora na memoria
  listaProdutos.clear();
   // recupera do armazenamento os produtos que foram salvos e coloca novamente na lista de produtos
  listaProdutos.addAll( await LocalStorageService.carregarProdutos(),);
   // limpa a lista de favoritos 
  listaFavoritos.clear();
   // recupera os favoritos salvos no celular e coloca novamente na lista de favoritos
  listaFavoritos.addAll(
    await LocalStorageService.carregarFavoritos(),
  );

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
