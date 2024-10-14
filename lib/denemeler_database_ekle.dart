import 'package:flutter/material.dart';
import 'package:ilac_takip/deneme_yerel_veri_tabani.dart';
import 'package:ilac_takip/model/user.dart';

class DenemelerDatabaseEkle extends StatefulWidget {
  const DenemelerDatabaseEkle({Key? key}) : super(key: key);

  @override
  State<DenemelerDatabaseEkle> createState() => _DenemelerDatabaseEkleState();
}

class _DenemelerDatabaseEkleState extends State<DenemelerDatabaseEkle> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();

  List<Users> _userList = [];
  DenemeYerelVeriTabani _yerelVeriTabani=DenemeYerelVeriTabani();

  void addUserDatabase() async {
    String _name = _nameController.text;
    String _age = _ageController.text;
    String _birthDay = _birthdayController.text;

    if (_name.isNotEmpty && _age.isNotEmpty && _birthDay.isNotEmpty) {
      Users user = Users(name: _name, age: _age, brithDay: _birthDay);
      await _yerelVeriTabani.createUser(user);
      _nameController.clear();
      _ageController.clear();
      _birthdayController.clear();
    }
  }

  void _loadUsers() async {
    List<Users> users = await _yerelVeriTabani.readTumUserlar();
    setState(() {
      _userList = users;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database Ekleme/Silme/Güncelleme"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Adınızı Giriniz",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Yaşınızı Giriniz",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Doğum tarihinizi Giriniz",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _loadUsers,
                  child: Text("DataBaseden ListBoxa Getir"),
                ),
                ElevatedButton(
                  onPressed: addUserDatabase,
                  child: Text("Database'e Ekle"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _userList.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        leading: Text(_userList[index].age),
                        title: Text(_userList[index].name),
                        subtitle:Text(_userList[index].brithDay),
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


/*
void addUser() {
    String _name = _nameController.text;
    String _age = _ageController.text;
    String _birthDay = _birthdayController.text;

    if (_name.isNotEmpty && _age.isNotEmpty && _birthDay.isNotEmpty) {
      setState(() {
        _userList.add({"name": _name, "age": _age, "birthDay": _birthDay});
      });
      _nameController.clear();
      _ageController.clear();
      _birthdayController.clear();
    }

    print(_userList);
  }

 */