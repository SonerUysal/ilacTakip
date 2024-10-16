import 'dart:async';

import 'package:ilac_takip/users/kitap.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class KitapVeriTabani {
  KitapVeriTabani._privateConstructor();

  static final KitapVeriTabani _nesne = KitapVeriTabani._privateConstructor();

  factory KitapVeriTabani(){
    return _nesne;
  }

  Database? _veriTabani;
  String _kitapTabloAdi = "kitaplar";
  String _kitapId = "id";
  String _kitapAdi = "adi";
  String _kitapYazarAdi = "yazarAdi";
  String _kitapBasimYili = "basimYili";
  String _kitapSayfaSayisi = "SayfaSayisi";

  Future<Database?> _veriTabaniniGetir() async {
    if (_veriTabani == null) {
      String dosyaYolu = await getDatabasesPath();
      String veriTabaniYolu = join(dosyaYolu, "kitaplar.db");
      _veriTabani = await openDatabase(
        veriTabaniYolu, version: 1,
        onCreate: _tabloOlustur,
      );
    }
    return _veriTabani;
  }


  Future<void> _tabloOlustur(Database db, int version) async {
    await db.execute("""
CREATE TABLE $_kitapTabloAdi (
	$_kitapId	INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
	$_kitapAdi	TEXT ,
	$_kitapYazarAdi	TEXT,
	$_kitapSayfaSayisi	INTEGER,
	$_kitapBasimYili	INTEGER

);
""");
  }

  /*

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

   */

  Future<int> createKitap(Kitap kitap) async{
    Database? db=await _veriTabaniniGetir();
    if(db != null){
      return await db.insert(_kitapTabloAdi, kitap.toMap());
    }else {
      return -1;
    }
  }

  Future<List<Kitap>> readTumKitaplar() async{
    Database? db=await _veriTabaniniGetir();
    List<Kitap> kitaplar=[];
    if(db != null){
      List<Map<String,dynamic>> userlarMap= await db.query(_kitapTabloAdi);
      for(Map<String, dynamic> m in userlarMap){
        Kitap i=Kitap.fromMap(m);
        kitaplar.add(i);
      }
    } return kitaplar;
  }



}