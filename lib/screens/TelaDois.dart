import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/classes/produto.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key, required this.title});

  final String title;

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  @override
  Widget build(BuildContext context) {
    // trava a tela na vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('imagens/logo3.png', height: 50),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 198, 92, 105),
      ),

      body: Column(
        children: [
          Text(
            "Produtos Favoritos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: listaFavoritos.length,
              itemBuilder: (context, index) {
                Produto produto = listaFavoritos[index];

                return TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(produto.nome),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                produto.imagem,
                                width: 200,
                                height: 200,
                              ),

                              SizedBox(height: 10),

                              Text(
                                produto.nome,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              Text("R\$ ${produto.preco}"),

                              Text(produto.descricao),

                              SizedBox(height: 15),

                              Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Color(0xFF25D366),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Fechar"),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Color.fromARGB(
                      255,
                      198,
                      92,
                      105,
                    ), // mantém o layout igual ao Container
                  ),

                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),

                    child: Row(
                      children: [
                        Image.asset(produto.imagem, width: 70, height: 70),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produto.nome,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              Text("R\$ ${produto.preco}"),
                            ],
                          ),
                        ),

                        IconButton(
                          icon: const Icon(Icons.bookmark),
                          onPressed: () {
                            setState(() {
                              listaFavoritos.remove(produto);
                              listaProdutos.add(produto);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
