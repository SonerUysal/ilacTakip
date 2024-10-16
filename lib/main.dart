import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:ilac_takip/denemeler.dart';
import 'package:ilac_takip/denemeler_database_ekle.dart';
import 'package:ilac_takip/ilacEkle.dart';
import 'package:ilac_takip/users/kitaplar.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  DateTime secTarih = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ilac Takip'),
      ),
      body: Center(
        child: Column(
          children: [
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                secTarih = selectedDate;
                //`selectedDate` the new date selected.
                print(selectedDate);
                print(secTarih);
              },
              locale: "tr",
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              "images/ilac1.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IlacEkle()));
                  },
                  child: Text("İlaç Ekle +"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Denemeler()));
                  },
                  child: Text("denemelerSayfasi"),
                ),


              ],

            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DenemelerDatabaseEkle()));
                  },
                  child: Text("denemelerDatabase"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kitaplar()));
                  },
                  child: Text("Kitaplar"),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
