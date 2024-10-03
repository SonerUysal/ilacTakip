import 'package:ilac_takip/model/ilac.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class YerelVeriTabani{

  YerelVeriTabani._privateConstructor();
  static final YerelVeriTabani _nesne=YerelVeriTabani._privateConstructor();

  factory YerelVeriTabani(){
    return _nesne;
  }

  Database? _veriTabani;
  String _ilaclarTabloAdi="ilaclar";
  String _idIlaclar ="id";
  String _ilacAdi="ilacAdi";

  Future<Database?> _veriTabaniniGetir() async{
    if(_veriTabani==null){
   String dosyaYolu=await getDatabasesPath();
   String veriTabaniYolu=join(dosyaYolu,"ilac.db");
   _veriTabani=await openDatabase(
     veriTabaniYolu, version: 1,
     onCreate: _tabloOlustur,
   );
    }
    return _veriTabani;
  }

  Future<void> _tabloOlustur(Database db, int versiyon) async{
   await db.execute(""" 
            CREATE TABLE $_ilaclarTabloAdi (
                    $_idIlaclar	INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
                    $_ilacAdi	TEXT NOT NULL
                  ); 
    """);
  }

  Future<int> createIlac(Ilac ilac) async{
    Database? db=await _veriTabaniniGetir();
    if(db != null){
     return await db.insert(_ilaclarTabloAdi, ilac.toMap());
    }else {
      return -1;
    }
  }

}