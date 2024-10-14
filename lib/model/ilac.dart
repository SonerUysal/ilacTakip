class Ilac {
  int? id;
  String ilacAdi;

  Ilac(this.ilacAdi);

  Ilac.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        ilacAdi = map["ilacAdi"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ilacAdi": ilacAdi,
    };
  }
}
