import 'package:flutter/material.dart';
import 'package:ilac_takip/users/kitap.dart';
import 'package:ilac_takip/users/kitap_veri_tabani.dart';

class Kitaplar extends StatefulWidget {
  const Kitaplar({Key? key}) : super(key: key);

  @override
  State<Kitaplar> createState() => _KitaplarState();
}

class _KitaplarState extends State<Kitaplar> {
  TextEditingController _kitapAdiController = TextEditingController();
  TextEditingController _kitapYazariController = TextEditingController();
  TextEditingController _kitapSayfaSayisiController = TextEditingController();
  TextEditingController _kitapBasimYiliController = TextEditingController();
  List<Kitap> _kitaplarList = [];
  KitapVeriTabani _kitapVeriTabani = KitapVeriTabani();

  void _kitapEkle() async {
    String _adi = _kitapAdiController.text;
    String _yazari = _kitapYazariController.text;
    int _sayfaSayisi = int.parse(_kitapSayfaSayisiController.text);
    int _yili = int.parse(_kitapBasimYiliController.text);

    if (_kitapAdiController.text.isNotEmpty &&
        _kitapYazariController.text.isNotEmpty) {
      Kitap kitap = Kitap(
          kitapAdi: _adi,
          kitapYazari: _yazari,
          kitapSayfaSayisi: _sayfaSayisi,
          kitapBasimYili: _yili);
      await _kitapVeriTabani.createKitap(kitap);
      _kitapAdiController.clear();
      _kitapYazariController.clear();
      _kitapBasimYiliController.clear();
      _kitapSayfaSayisiController.clear();
    }
    loadKitap();
  }

  void loadKitap() async {
    List<Kitap> kitaplar = await _kitapVeriTabani.readTumKitaplar();
    setState(() {
      _kitaplarList = kitaplar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // ekran klavyesi açılınca ekran taşma sorunu için
      appBar: AppBar(
        title: Text("Kitap Kayıt Sayfası"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _kitapAdiController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kitap Adını Giriniz"),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _kitapYazariController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kitap Yazarı Giriniz"),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _kitapBasimYiliController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kitap Basım Yılını Giriniz"),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _kitapSayfaSayisiController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kitap Sayfa Sayısını Giriniz"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: _kitapEkle, child: Text("Liste Ekle")),
            ElevatedButton(
                onPressed: loadKitap, child: Text("Kitapları Getir")),
            Expanded(
              child: ListView.builder(
                  itemCount: _kitaplarList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Text(
                            _kitaplarList[index].kitapSayfaSayisi.toString()),
                        title: Text(_kitaplarList[index].kitapAdi),
                        subtitle: Text(_kitaplarList[index].kitapYazari),
                        onTap: () {
                          print(_kitaplarList[index].kitapAdi);
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
