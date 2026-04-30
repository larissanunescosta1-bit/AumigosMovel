import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key, required this.title});

  final String title;
  @protected
  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
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
            child: ListView(
              children: [
                TextButton(
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
                                "imagens/bandana.png",
                                width: 200,
                                height: 200,
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Bandana",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              Text("R\$ 30,00"),
                              Text("Bandana com detalhes!!! TAM: medio"),

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
                        Image.asset(
                          "imagens/bandana.png",
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bandana",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("R\$ 30,00"),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Aviso"),
                                  content: Text(
                                    "Você adicionou aos favoritos!",
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
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
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Roupinha"),

                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "imagens/roupinha.png",
                                width: 200,
                                height: 200,
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Roupinha",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              Text("R\$ 50,00"),
                              Text("Jardineira mais fofa! TAM: pequeno"),

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
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Fechar"),
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
                        Image.asset(
                          "imagens/roupinha.png",
                          width: 70,
                          height: 70,
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Roupinha",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("R\$ 50,00"),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Aviso"),
                                  content: Text(
                                    "Você adicionou aos favoritos!",
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
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
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Lacinho Rosa"),

                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "imagens/lacinhoRosa.png",
                                width: 200,
                                height: 200,
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Bandana verde",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              Text("R\$ 10,00"),
                              Text("O lacinho mais fofo!!! TAM: pequeno"),

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
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Fechar"),
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
                        Image.asset(
                          "imagens/lacinhoRosa.png",
                          width: 70,
                          height: 70,
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lacinho Rosa",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("R\$ 10,00"),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Aviso"),
                                  content: Text(
                                    "Você adicionou aos favoritos!",
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
