import 'package:depouygulama/class/veritabani.dart';
import 'package:depouygulama/pages/duzenle_page.dart';
import 'package:depouygulama/pages/ekle_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? role;

  const HomePage({super.key, required this.role});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anasayfa",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.output, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: Veritabani.urunler.length,
        itemBuilder: (context, index) {
          //ürünleri listeleme index ile veritabanındaki ürünlere erişiyoruz her bir eleman için bir kart oluşturuyoruz
          return GestureDetector(
            onLongPress: widget.role == "Admin"
                ? () {
                    Veritabani.urunler.removeAt(index);
                    setState(() {});
                  }
                : null,
            child: Card(
              color: Colors.lightBlueAccent,
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ), //sepet ikonu
                title: Text("${Veritabani.urunler[index].urunAdi}"),
                subtitle: Row(
                  children: [
                    Text(
                      "${Veritabani.urunler[index].fiyat} TL",
                      style: TextStyle(
                        color: const Color.fromARGB(242, 255, 0, 0),fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(" - ", style: TextStyle(color: Colors.white)),
                    Text(
                      "${Veritabani.urunler[index].kategori}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                trailing: widget.role == "Admin"
                    ? IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DuzenlePage(urun: Veritabani.urunler[index]),
                            ),
                          ); //düzenleme sayfasına geçiş
                          setState(() {});
                        },
                        icon: Icon(Icons.edit, color: Colors.white),
                      )
                    : null, //düzenleme ikonu
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.indigo,
      floatingActionButton: widget.role == "Admin"
          ? FloatingActionButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EklePage()),
                ); //yeni ürün ekleme sayfasına geçiş

                setState(() {});
              },
              child: const Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.deepPurple,
            )
          : null,
    );
  }
}
