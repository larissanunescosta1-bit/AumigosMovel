import 'dart:convert';

class Produto {
  final int id;
  final String nome;
  final double preco;
  final String imagem;
  final String descricao;
  bool favorito;

  //construtor da classe que recer cada um de seus atributos
  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.descricao,
    this.favorito = false,
  });

  // Converte o objeto para um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'imagem': imagem,
      'descricao': descricao,
      'favorito': favorito,
    };
  }

  // Cria um objeto a partir de un Map
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      preco: (map['preco'] ?? 0.0).toDouble(),
      imagem: map['imagem'],
      descricao: map['descricao'],
      favorito: map['favorito'] ?? false,
    );
  }

  // Facilita a conversão de uma lista de objetos para uma String JSON
  static String encode(List<Produto> produtos) => json.encode(
    produtos.map<Map<String, dynamic>>((p) => p.toMap()).toList(),
  );

  // Facilita a conversão de uma String JSON para uma lista de objetos
  static List<Produto> decode(String produtosJson) =>
      (json.decode(produtosJson) as List<dynamic>)
          .map<Produto>((item) => Produto.fromMap(item))
          .toList();
}
