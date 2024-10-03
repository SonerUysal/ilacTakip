import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilac_takip/model/ilac.dart';
import 'package:ilac_takip/yerel_veri_tabani.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import 'package:numberpicker/numberpicker.dart';

class IlacEkle extends StatefulWidget {
  @override
  State<IlacEkle> createState() => _IlacEkleState();
}

class _IlacEkleState extends State<IlacEkle> {
YerelVeriTabani _yerelVeriTabani=YerelVeriTabani();

  TextEditingController _controller = TextEditingController();
  String ilacCesidi = "hap"; //varsayılan ilaç alma çeşidi
  List<String> ilacCesitleri = [
    //ilaç alma türleri listesi
    "hap",
    "parça",
    "ml",
    "mg",
    "kapak"
  ]; //ilaç alma çeşitleri
  double _currentDoubleValue = 1.0; //varsayılan ilaç alma dozu
  DateTime ilacZaman = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İlaç Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "İlaç Adı",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 16,
                    ),
                    Text(
                      "Zaman",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _ilacEkle(context);
                  },
                  child: Text("+Ekle"),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Colors.black,
            )

            /*
            buildZamanLabelRow(),
            SizedBox(
              height: 15,
            ),
            buildZamanTextFieldRow(),

           */
          ],
        ),
      ),
    );
  }

  Row buildZamanLabelRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          // mainAxisAlignment: MainAxisSize.min,
          children: [
            Icon(
              Icons.access_time_outlined,
              size: 16,
            ),
            Text(
              "Zaman",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Text(
          "Doz",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "    ",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Row buildZamanTextFieldRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 150,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          width: 150,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
        ),
        // TextFormField(),
      ],
    );
  }

  void _ilacEkle(BuildContext context) async {
    String? eklenenIlac=await pencereAc(context);
    if( eklenenIlac !=null){
      Ilac yeniIlac=Ilac(eklenenIlac);
      int ilacIdsi= await _yerelVeriTabani.createIlac(yeniIlac);
      print("eklenenIlacidsi: $ilacIdsi");
    }

  }

  Future<String?> pencereAc(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(

              builder: (BuildContext context, StateSetter setState) {

                return AlertDialog(
                  title: const Text('İlaç Ekle'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TimePickerSpinnerPopUp(
                          mode: CupertinoDatePickerMode.time,
                          initTime: ilacZaman,
                          onChange: (secilenZaman) {
                            setState(() {
                              ilacZaman = secilenZaman;
                              print(ilacZaman);
                            });
                            // Implement your logic with select dateTime
                          },
                        ),
                        Row(
                          children: [
                            DecimalNumberPicker(
                              value: _currentDoubleValue,
                              itemWidth: 50,
                              minValue: 0,
                              maxValue: 1000,
                              decimalPlaces: 2,
                              onChanged: (value) =>
                                  setState(() => _currentDoubleValue = value),
                            ),
                            DropdownButton(
                                items: ilacCesitleri
                                    .map(
                                      (String oankiIlacCesidi) =>
                                      DropdownMenuItem(
                                          child: Text(oankiIlacCesidi),
                                          value: oankiIlacCesidi),
                                )
                                    .toList(),
                                value: ilacCesidi,
                                onChanged: (String? secilen) {
                                  setState(() {
                                    ilacCesidi = secilen!;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ekle'),
                      onPressed: () {
                        Navigator.of(context).pop(ilacCesidi);

                      },
                    ),
                  ],
                );
              }
          ),
    );
  }
}
