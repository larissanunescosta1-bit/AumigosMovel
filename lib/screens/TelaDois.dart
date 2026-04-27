import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

      body: ListView(
        children: [
          Text(
            "Produtos Favoritos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Lacinhos"),

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
                        Text("Bandana com detalhes TAM: medio"),

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
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Image.asset("imagens/bandana.png", width: 70, height: 70),

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
                    icon: Icon(Icons.bookmark, color: Colors.grey),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Aviso"),
                            content: Text("Você removeu dos favoritos!"),
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
                    title: Text("Bandana"),

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
                          "Lacinho Rosa",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Text("R\$ 10,00"),
                        Text("O lacinho mais fofo!!! TAM: Pequeno"),

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
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Image.asset("imagens/lacinhoRosa.png", width: 70, height: 70),

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
                    icon: Icon(Icons.bookmark, color: Colors.grey),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Aviso"),
                            content: Text("Você removeu dos favoritos!"),
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
    );
  }
}
