import 'package:flutter/material.dart';

// listbox a satır satır ekleme yapma
class Denemeler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Listeye Ekleme Örneği2'),
        ),
        body: ListeTextEkleme(),
      ),
    );
  }
}

class ListeTextEkleme extends StatefulWidget {
  const ListeTextEkleme({Key? key}) : super(key: key);

  @override
  State<ListeTextEkleme> createState() => _ListeTextEklemeState();
}

class _ListeTextEklemeState extends State<ListeTextEkleme> {
  TextEditingController _controller = TextEditingController();
  List<String> _items = [];

  void listeEkle() {
    if (_controller.text.isNotEmpty) {
      _items.add(_controller.text);
      _controller.clear();
      print(_items);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Eklenecek Metni Girin",
            ),
          ),
          ElevatedButton(
            onPressed: listeEkle,
            child: Text("Ekle"),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_items[index]),
                      onTap: () {
                        print(_items[index]);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(_items[index]),
                                content: Text("Seçmiş olduğunuz Metin bu mu?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Evet")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Hayır")),
                                ],
                              );
                            });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

/*
class ListboxTextEkleme extends StatefulWidget {
  @override
  State<ListboxTextEkleme> createState() => _ListboxTextEklemeState();
}

class _ListboxTextEklemeState extends State<ListboxTextEkleme> {
  final TextEditingController _controller = TextEditingController();
  List<String> _items = [];

  void _listeyeEkle() {
    if (_controller.text.isNotEmpty) {
      _items.add(_controller.text);
      _controller.clear();
      print(_items);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Eklenecek Metni Giriniz"),
          ),
          ElevatedButton(
            onPressed: _listeyeEkle,
            child: Text("Ekle"),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Text("leading"),
                    title: Text(_items[index]),
                    subtitle: Text("subtitle"),
                    trailing: Text("trailing"),
                  onTap: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:(context)
                      {
                        return AlertDialog(
                          title: Text(_items[index]),
                          content: Text("Seçimi Onaylıyor musunuz?"),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: Text("Evet"),),
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: Text("Hayır"),),
                          ],
                        );
                      }
                      );
                      print(_items[index]);
                  },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void burcuGelisSaatiSor()
{

bool yemekYapmayaBaslayim;
int? evegelmeSaatin;

if(
evegelmeSaatin== 12){
yemekYapmayaBaslayim=true;
}else {
yemekYapmayaBaslayim=false;
}}


*/
