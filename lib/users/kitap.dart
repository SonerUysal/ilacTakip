class Kitap {
  int? id;
  String kitapAdi;
  String kitapYazari;
  int kitapSayfaSayisi;
  int kitapBasimYili;

  Kitap(
      {this.id,
      required this.kitapAdi,
      required this.kitapYazari,
      required this.kitapSayfaSayisi,
      required this.kitapBasimYili});

  // Veri tabanından veriyi okuma için
  Kitap.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        kitapAdi = map["adi"],
        kitapYazari = map["yazarAdi"],
        kitapSayfaSayisi = map["SayfaSayisi"],
        kitapBasimYili = map["basimYili"];

  //Veri tabanına veriyi kaydetme-ekleme için
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "adi": kitapAdi,
      "yazarAdi": kitapYazari,
      "sayfaSayisi": kitapSayfaSayisi,
      "basimYili": kitapBasimYili,
    };
  }
}
