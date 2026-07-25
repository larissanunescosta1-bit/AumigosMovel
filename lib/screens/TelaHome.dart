import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/classes/produto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key, required this.title});

  final String title;
  @protected
  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<Produto> produtos = [];
  @override
  void initState() {
    super.initState();

    produtos = listaProdutos;
    LocalStorageService.carregarProdutos().then((lista) {
      setState(() {
        produtos = lista;
      });
    });

    LocalStorageService.carregarFavoritos().then((lista) {
      setState(() {
        listaFavoritos.clear();
        listaFavoritos.addAll(lista);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            margin: EdgeInsets.all(10),
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Categoria"),
                          content: Text("Você clicou em Lacinhos"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 198, 92, 105),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Lacinhos",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Categoria"),
                          content: Text("Você clicou em Bandanas"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 198, 92, 105),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Bandanas",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Categoria"),
                          content: Text("Você clicou em Roupas"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 198, 92, 105),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Roupas", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                Produto produto = produtos[index];
                return TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(""),

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

                              IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Color(0xFF25D366),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("WhatsApp"),
                                        content: Text(
                                          "Deseja entrar em contato pelo WhatsApp?",
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text("Cancelar"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text("Abrir"),
                                            onPressed: () {
                                              Navigator.of(context).pop();

                                              // Aqui você pode colocar a ação depois
                                              // Ex: abrir o WhatsApp
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),

                          actions: [
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Fechar"),
                            ),
                            SizedBox(width: 10),
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
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produto.nome,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("R\$ ${produto.preco}"),
                              Text(produto.descricao),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            listaFavoritos.contains(produto)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: listaFavoritos.contains(produto)
                                ? Colors.amber
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              produtos.remove(produto);
                              listaFavoritos.add(produto);
                            });
                            LocalStorageService.salvarProdutos(listaProdutos);
                            LocalStorageService.salvarFavoritos(listaFavoritos);
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
