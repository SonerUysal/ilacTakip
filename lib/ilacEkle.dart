import 'package:flutter/material.dart';

class IlacEkle extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

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
                  onPressed: () {},
                  child: Text("+Ekle"),
                ),
              ],
            ),
          Divider( height: 10,color:Colors.black ,)

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
