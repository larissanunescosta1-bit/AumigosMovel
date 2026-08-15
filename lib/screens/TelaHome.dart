import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/classes/produto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
// inicializa a lista da tela com os produtos salvos
    produtos = listaProdutos;
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
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                //&& produto.nome.contains("other")
                Produto produto = produtos[index];
                if (flagFiltro == "Todos"){
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
                                              onPressed: ()async {
                                                Navigator.of(context).pop();

                                                  final Uri whatsapp = Uri.parse(
                           'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                               );

                             if (await canLaunchUrl(whatsapp)) {
      await launchUrl(
        whatsapp,
        mode: LaunchMode.externalApplication,
      );}
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
                               // Se o produto estiver nos favoritos mostra o negocinho  preenchido.
                               
                              listaFavoritos.contains(produto)
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: listaFavoritos.contains(produto)
                                  ? Colors.amber
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              // atualiza a tela depois de favoritar
                              setState(() {
                                // Remove o produto da lista principal e vai para a area dos favoritos
                                produtos.remove(produto);
                                listaFavoritos.add(produto);
                              });

                              LocalStorageService.salvarProdutos(produtos);
                              LocalStorageService.salvarFavoritos(
                                listaFavoritos,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
              }
                else if (flagFiltro == "Lacinho"){
                  if (produto.nome.contains("Lacinho")){
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
                                                onPressed: ()async {
                                                  Navigator.of(context).pop();

                                                  final Uri whatsapp = Uri.parse(
                           'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                               );

                             if (await canLaunchUrl(whatsapp)) {
      await launchUrl(
        whatsapp,
        mode: LaunchMode.externalApplication,
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

                                LocalStorageService.salvarProdutos(produtos);
                                LocalStorageService.salvarFavoritos(
                                  listaFavoritos,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }

                  else if (flagFiltro == "Bandana"){
                    if (produto.nome.contains("Bandana")){
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
                                                  onPressed: ()async {
                                                    Navigator.of(context).pop();
                                final Uri whatsapp = Uri.parse(
                           'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                               );

                            if (await canLaunchUrl(whatsapp)) {
      await launchUrl(
        whatsapp,
        mode: LaunchMode.externalApplication,
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
                              Image.asset(
                                produto.imagem,
                                width: 70,
                                height: 70,
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

                                  LocalStorageService.salvarProdutos(produtos);
                                  LocalStorageService.salvarFavoritos(
                                    listaFavoritos,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                    else if (flagFiltro == "Roupinha"){
                      if (produto.nome.contains("Roupinha")){
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
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("Abrir"),
                                                    onPressed: ()async {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
  final Uri whatsapp = Uri.parse(
                           'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                               );

                           if (await canLaunchUrl(whatsapp)) {
      await launchUrl(
        whatsapp,
        mode: LaunchMode.externalApplication,
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
                                Image.asset(
                                  produto.imagem,
                                  width: 70,
                                  height: 70,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                                    LocalStorageService.salvarProdutos(
                                      produtos,
                                    );
                                    LocalStorageService.salvarFavoritos(
                                      listaFavoritos,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                    }
                  }
              },
            ),
          ),
        ],
      ),
    );
  }

  String flagFiltro = "Todos";
}
