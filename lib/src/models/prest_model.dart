

class PrestModel {
    int id;
    String tipo;
    String valor;

    PrestModel({
        this.id,
        this.tipo,
        this.valor,
    });

    factory PrestModel.fromJson(Map<String, dynamic> json) => PrestModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };

  toList() {}
}
