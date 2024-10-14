import 'package:ilac_takip/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DenemeYerelVeriTabani{
  DenemeYerelVeriTabani._privateConstructor();
  static final DenemeYerelVeriTabani _nesne=DenemeYerelVeriTabani._privateConstructor();

  factory DenemeYerelVeriTabani(){
    return _nesne;
  }

  Database? _veriTabani;
  String _userTabloAdi="users";
  String _userId ="id";
  String _userName="userName";
  String _userAge="userAge";
  String _userbirthDay="userbirthDay";

  Future<Database?> _veriTabaniniGetir() async{
    if(_veriTabani==null){
      String dosyaYolu=await getDatabasesPath();
      String veriTabaniYolu=join(dosyaYolu,"users.db");
      _veriTabani=await openDatabase(
        veriTabaniYolu, version: 1,
        onCreate: _tabloOlustur,
      );
    }
    return _veriTabani;
  }


  Future<void> _tabloOlustur(Database db, int versiyon) async{
    await db.execute(""" 
            CREATE TABLE $_userTabloAdi (
                    $_userId	INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
                    $_userName	TEXT,
                    $_userAge	TEXT,
                    $_userbirthDay	TEXT
                  ); 
    """);
  }

  Future<int> createUser(Users users) async{
    Database? db=await _veriTabaniniGetir();
    if(db != null){
      return await db.insert(_userTabloAdi, users.toMap());
    }else {
      return -1;
    }
  }

  Future<List<Users>> readTumUserlar() async{
    Database? db=await _veriTabaniniGetir();
    List<Users> userlar=[];
    if(db != null){
      List<Map<String,dynamic>> userlarMap= await db.query(_userTabloAdi);
      for(Map<String, dynamic> m in userlarMap){
        Users i=Users.fromMap(m);
        userlar.add(i);
      }
    } return userlar;
  }

}