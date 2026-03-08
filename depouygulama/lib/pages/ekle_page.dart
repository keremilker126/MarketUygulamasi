import 'package:depouygulama/class/veritabani.dart';
import 'package:flutter/material.dart';
import 'package:depouygulama/class/urun.dart';
class EklePage extends StatefulWidget {
  const EklePage({super.key});

  @override
  State<EklePage> createState() => _EklePageState();
}

class _EklePageState extends State<EklePage> {
  @override
  Widget build(BuildContext context) {
    final _urunAdiController = TextEditingController();
    final _fiyatController = TextEditingController();
    final _kategoriController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yeni Ürün Ekle")),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _urunAdiController,
                decoration: const InputDecoration(labelText: "Ürün Adı", border: OutlineInputBorder(),labelStyle: TextStyle(color: Colors.cyan),fillColor: Colors.white, filled: true),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _fiyatController,
                decoration: const InputDecoration(labelText: "Fiyat", border: OutlineInputBorder(),labelStyle: TextStyle(color: Colors.cyan),fillColor: Colors.white, filled: true),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _kategoriController,
                decoration: const InputDecoration(labelText: "Kategori", border: OutlineInputBorder(),labelStyle: TextStyle(color: Colors.cyan),fillColor: Colors.white, filled: true),
               ),
            ),
             SizedBox(height: 20),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: (){
              if(_urunAdiController.text.isNotEmpty && _fiyatController.text.isNotEmpty && _kategoriController.text.isNotEmpty){
                Veritabani.urunler.add(Urun(_urunAdiController.text,int.parse(_fiyatController.text),_kategoriController.text));
                Navigator.pop(context);

              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lütfen tüm alanları doldurun")));
              }
             }, child: const Text("Ekle", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}