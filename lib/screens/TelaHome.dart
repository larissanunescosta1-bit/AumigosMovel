import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/objects/produto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/modelo/api/Sincroniza.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key, required this.title});

  final String title;
  @protected
  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<Produto> produtos = [];
  List<Produto> produtosLacinhos = [];
  List<Produto> produtosBandanas = [];
  List<Produto> produtosRoupinhas = [];
  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    try {
      Sincroniza sincroniza = Sincroniza();

      List<Produto> produtosApi = await sincroniza.requestProdutos();

      setState(() {
        produtos = produtosApi;

        produtosLacinhos.clear();
        produtosBandanas.clear();
        produtosRoupinhas.clear();
        print("========== PRODUTOS ==========");

        for (Produto p in produtos) {
         print("==============================");
  print("ID: ${p.id}");
  print("NOME: ${p.nome}");
  print("CATEGORIA: ${p.categoria}");
  print("IMAGEM: ${p.imagem}");
        }

        for (Produto p in produtos) {
          if (p.categoria == "Lacinhos" ||
              p.categoria == "Lacinho" ||
              p.nome.contains("Lacinho")) {
            produtosLacinhos.add(p);
          } else if (p.categoria == "Bandanas" ||
              p.categoria == "Bandana" ||
              p.nome.contains("Bandana")) {
            produtosBandanas.add(p);
          } else if (p.categoria == "Roupas" ||
              p.categoria == "Roupinhas" ||
              p.categoria == "Roupinha") {
            produtosRoupinhas.add(p);
          }
        }
      });
    } catch (e) {
      print("Erro ao buscar produtos: $e");
    }
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
                // filtro aonde  que mostra todos os produtos.
                TextButton(
                  onPressed: () {
                    setState(() {
                      flagFiltro = "Todos";
                      print(flagFiltro);
                      print(listaProdutos);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 198, 92, 105),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Todos", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      flagFiltro = "Lacinho";
                      print(flagFiltro);
                      print(listaProdutos);
                    });
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
                    setState(() {
                      flagFiltro = "Bandana";
                      print(flagFiltro);
                      print(listaProdutos);
                    });
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
                    setState(() {
                      flagFiltro = "Roupinha";
                      print(flagFiltro);
                      print(listaProdutos);
                    });
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
            child: flagFiltro == "Todos"
                ? ListView.builder(
                    itemCount: produtos.length,
                    itemBuilder: (context, index) {
                      //&& produto.nome.contains("other")
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
                               Image.network(
                                      'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      webHtmlElementStrategy:
                                          WebHtmlElementStrategy.prefer,
                                    ),

                                    SizedBox(height: 10),

                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                                  onPressed: () async {
                                                    Navigator.of(context).pop();

                                                    final Uri
                                                    whatsapp = Uri.parse(
                                                      'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                                                    );

                                                    if (await canLaunchUrl(
                                                      whatsapp,
                                                    )) {
                                                      await launchUrl(
                                                        whatsapp,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    }
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
                          key: ValueKey(produto.id),
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
                               Image.network(
                                'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                 webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  );
                                },
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("R\$ ${produto.preco}"),
                                    Text(produto.descricao),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  listaFavoritos.any((p) => p.id == produto.id)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      listaFavoritos.any(
                                        (p) => p.id == produto.id,
                                      )
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    if (listaFavoritos.any(
                                      (p) => p.id == produto.id,
                                    )) {
                                      // Se já está favoritado, remove dos favoritos
                                      listaFavoritos.removeWhere(
                                        (p) => p.id == produto.id,
                                      );
                                      produto.favorito = false;
                                    } else {
                                      // Se não está favoritado, adiciona
                                      listaFavoritos.add(produto);
                                      produto.favorito = true;
                                    }
                                  });

                                  await LocalStorageService.salvarFavoritos(
                                    listaFavoritos,
                                  );
                                  print("FAVORITOS SALVOS:");
                                  for (Produto p in listaFavoritos) {
                                    print("${p.id} - ${p.nome}");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ////////////////////////////////////////////////////////////////////////////////
                : flagFiltro == "Lacinho"
                ? ListView.builder(
                    itemCount: produtosLacinhos.length,
                    itemBuilder: (context, index) {
                      //&& produto.nome.contains("other")
                      Produto produto = produtosLacinhos[index];

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
                                    Image.network(
                                      'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      webHtmlElementStrategy:
                                          WebHtmlElementStrategy.prefer,
                                    ),

                                    SizedBox(height: 10),

                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                                  onPressed: () async {
                                                    Navigator.of(context).pop();

                                                    final Uri
                                                    whatsapp = Uri.parse(
                                                      'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                                                    );

                                                    if (await canLaunchUrl(
                                                      whatsapp,
                                                    )) {
                                                      await launchUrl(
                                                        whatsapp,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    }
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
                          key: ValueKey(produto.id),
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
                              Image.network(
                                'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                webHtmlElementStrategy:
                                    WebHtmlElementStrategy.prefer,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  );
                                },
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("R\$ ${produto.preco}"),
                                    Text(produto.descricao),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  listaFavoritos.any((p) => p.id == produto.id)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      listaFavoritos.any(
                                        (p) => p.id == produto.id,
                                      )
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    if (listaFavoritos.any(
                                      (p) => p.id == produto.id,
                                    )) {
                                      // Se já está favoritado, remove dos favoritos
                                      listaFavoritos.removeWhere(
                                        (p) => p.id == produto.id,
                                      );
                                      produto.favorito = false;
                                    } else {
                                      // Se não está favoritado, adiciona
                                      listaFavoritos.add(produto);
                                      produto.favorito = true;
                                    }
                                  });

                                  await LocalStorageService.salvarFavoritos(
                                    listaFavoritos,
                                  );
                                  print("FAVORITOS SALVOS:");
                                  for (Produto p in listaFavoritos) {
                                    print("${p.id} - ${p.nome}");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : flagFiltro == "Bandana"
                ? ListView.builder(
                    itemCount: produtosBandanas.length,
                    itemBuilder: (context, index) {
                      //&& produto.nome.contains("other")
                      Produto produto = produtosBandanas[index];

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
                                    Image.network(
                                      'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      webHtmlElementStrategy:
                                          WebHtmlElementStrategy.prefer,
                                    ),

                                    SizedBox(height: 10),

                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                                  onPressed: () async {
                                                    Navigator.of(context).pop();

                                                    final Uri
                                                    whatsapp = Uri.parse(
                                                      'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                                                    );

                                                    if (await canLaunchUrl(
                                                      whatsapp,
                                                    )) {
                                                      await launchUrl(
                                                        whatsapp,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    }
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
                          key: ValueKey(produto.id),
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
                               Image.network(
                                'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                  webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  );
                                },
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("R\$ ${produto.preco}"),
                                    Text(produto.descricao),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  listaFavoritos.any((p) => p.id == produto.id)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      listaFavoritos.any(
                                        (p) => p.id == produto.id,
                                      )
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    if (listaFavoritos.any(
                                      (p) => p.id == produto.id,
                                    )) {
                                      // Se já está favoritado, remove dos favoritos
                                      listaFavoritos.removeWhere(
                                        (p) => p.id == produto.id,
                                      );
                                      produto.favorito = false;
                                    } else {
                                      // Se não está favoritado, adiciona
                                      listaFavoritos.add(produto);
                                      produto.favorito = true;
                                    }
                                  });

                                  await LocalStorageService.salvarFavoritos(
                                    listaFavoritos,
                                  );
                                  print("FAVORITOS SALVOS:");
                                  for (Produto p in listaFavoritos) {
                                    print("${p.id} - ${p.nome}");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                //////////////////////////////////////////////////////
                ///
                : flagFiltro == "Roupinha"
                ? ListView.builder(
                    itemCount: produtosRoupinhas.length,
                    itemBuilder: (context, index) {
                      //&& produto.nome.contains("other")
                      Produto produto = produtosRoupinhas[index];

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
                                    Image.network(
                                      'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      webHtmlElementStrategy:
                                          WebHtmlElementStrategy.prefer,
                                    ),

                                    SizedBox(height: 10),

                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                                  onPressed: () async {
                                                    Navigator.of(context).pop();

                                                    final Uri
                                                    whatsapp = Uri.parse(
                                                      'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                                                    );

                                                    if (await canLaunchUrl(
                                                      whatsapp,
                                                    )) {
                                                      await launchUrl(
                                                        whatsapp,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    }
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
                          key: ValueKey(produto.id),
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
                              Image.network(
                                'https://aumigoswebteste.wasmer.app/storage/${produto.imagem}',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                  webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  );
                                },
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produto.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("R\$ ${produto.preco}"),
                                    Text(produto.descricao),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  listaFavoritos.any((p) => p.id == produto.id)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      listaFavoritos.any(
                                        (p) => p.id == produto.id,
                                      )
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    if (listaFavoritos.any(
                                      (p) => p.id == produto.id,
                                    )) {
                                      // Se já está favoritado, remove dos favoritos
                                      listaFavoritos.removeWhere(
                                        (p) => p.id == produto.id,
                                      );
                                      produto.favorito = false;
                                    } else {
                                      // Se não está favoritado, adiciona
                                      listaFavoritos.add(produto);
                                      produto.favorito = true;
                                    }
                                  });

                                  await LocalStorageService.salvarFavoritos(
                                    listaFavoritos,
                                  );
                                  print("FAVORITOS SALVOS:");
                                  for (Produto p in listaFavoritos) {
                                    print("${p.id} - ${p.nome}");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                //////////////////////////////////////////////////////////
             
                : Container(),
          ),
        ],
      ),
    );
  }

  String flagFiltro = "Todos";
}
