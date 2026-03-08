import 'package:depouygulama/class/veritabani.dart';
import 'package:flutter/material.dart';

class DuzenlePage extends StatefulWidget {
  final urun;
  const DuzenlePage({super.key, required this.urun});

  @override
  State<DuzenlePage> createState() => _DuzenlePageState();
}

class _DuzenlePageState extends State<DuzenlePage> {
    final TextEditingController _urunAdiController = TextEditingController();
    final TextEditingController _fiyatController = TextEditingController();
    final TextEditingController _kategoriController = TextEditingController();
    @override
  void initState() {
    super.initState();
    _urunAdiController.text = widget.urun.urunAdi;//ürün adını textfielda yazma
    _fiyatController.text = widget.urun.fiyat.toString();//fiyatı textfielda yazma
    _kategoriController.text = widget.urun.kategori;//kategoriyi textfielda yazma
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Düzenle")),
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
              onPressed: (){//indexof ile veritabanındaki ürünün indexini bulup o indexteki ürünü güncelliyoruz
             if(_urunAdiController.text.isNotEmpty && _fiyatController.text.isNotEmpty && _kategoriController.text.isNotEmpty){
                Veritabani.urunler[Veritabani.urunler.indexOf(widget.urun)].urunAdi = _urunAdiController.text;//veritabanındaki ürünün adını güncelleme
                Veritabani.urunler[Veritabani.urunler.indexOf(widget.urun)].fiyat = int.parse(_fiyatController.text);
                Veritabani.urunler[Veritabani.urunler.indexOf(widget.urun)].kategori = _kategoriController.text;
             
                Navigator.pop(context);
             }
             else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lütfen tüm alanları doldurun")));
             }
             }, child: const Text("Güncelle", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}