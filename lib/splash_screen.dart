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
    Future<void> iniciarApp() async {
  await ListaProdutoController.inicializarProdutos(listaProdutos);
  listaProdutos.clear();
  listaProdutos.addAll( await LocalStorageService.carregarProdutos(),);
  listaFavoritos.clear();
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
