class Users {
  int? id;
  String name;
  String age;
  String brithDay;

  Users({this.id,required this.name, required this.age, required this.brithDay});

  // Veritabanından veriyi çekerken kullanacağımız named constructor
  Users.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["userName"],
        age = map["userAge"],
        brithDay = map["userbirthDay"];

// Veritabanına eklerken kullanacağımız Map'e dönüştürme fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userName": name,
      "userAge": age,
      "userbirthDay": brithDay,
    };
  }
}

