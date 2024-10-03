class Ilac{
  int? id;
  String ilacAdi;

  Ilac( this.ilacAdi);
  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "ilacAdi":ilacAdi,
    };
  }
}