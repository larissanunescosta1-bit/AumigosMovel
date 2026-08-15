import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/modelo/classes/lista_produtos.dart';
import 'package:flutter_application_1/modelo/classes/produto.dart';
import 'package:flutter_application_1/modelo/local_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
               // define a quantidade de itens que vao ser mostrados
              // aqui e usada a quantidade de produtos favoritados
              itemCount: listaFavoritos.length,
              // Cria cada produto da lista de favoritos
              itemBuilder: (context, index) {
                // pega o produto de acordo com aposição atual da lista.
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
                // Fecha a janela de confirmação.
                Navigator.of(context).pop();

                // Cria o endereço do WhatsApp.
                final Uri whatsapp = Uri.parse(
                  'https://wa.me/5537999999999?text=Olá!%20Tenho%20interesse%20na%20${produto.nome}.',
                );

                // Verifica se o endereço pode ser aberto.
                if (await canLaunchUrl(whatsapp)) {
                  // Abre o WhatsApp fora do aplicativo.
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
                              // Atualiza a tela depois de remover o produto da lista de favoritos
                            setState(() {
                              listaFavoritos.remove(produto);
                              // Coloca o produto novamente na lista principal
                              listaProdutos.add(produto);
                            });
                              // salva a lista de produtos atualizada.
                            LocalStorageService.salvarProdutos(listaProdutos);
                            // salva a lista de favoritos atualizada
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
