// ignore_for_file: prefer_const_declarations

class CartaoFields {
  static final List<String> cartoes = [id, nomeBanco, tipoCartao];
  static final String id = '_id';
  static final String nomeBanco = '_nomebanco';
  static final String tipoCartao = '_tipoCartao';
}

class Cartao {
  final int? id;
  final String? nomebanco;
  final bool? tipoCartao;

  Cartao({this.id, this.nomebanco, this.tipoCartao});

  Cartao copy({
    int? id,
    String? nomebanco,
    bool? tipoCartao,
  }) =>
      Cartao(
          id: id ?? this.id,
          nomebanco: nomebanco ?? this.nomebanco,
          tipoCartao: tipoCartao ?? this.tipoCartao);

  static Cartao fromJson(Map<String, Object?> json) => Cartao(
      id: json[CartaoFields.id] as int?,
      nomebanco: json[CartaoFields.nomeBanco] as String,
      tipoCartao: json[CartaoFields.tipoCartao] == 1);

  Map<String, Object?> toJson() => {
        CartaoFields.id: id,
        CartaoFields.nomeBanco: nomebanco,
        CartaoFields.tipoCartao: tipoCartao
      };
}
