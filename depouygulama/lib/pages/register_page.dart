import 'package:flutter/material.dart';
import 'package:depouygulama/class/kayitlar.dart';
import 'package:depouygulama/pages/home_page.dart';
import 'package:depouygulama/class/kayitveritabani.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = "User"; // Varsayılan olarak "User" seçili
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Center(child: const Text("Register Page", style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false// Geri butonunu kaldır
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    _selectedRole = "User";
                  });
                }, icon:Icon(Icons.person, color: _selectedRole == "User" ? Colors.blue : Colors.grey)),
                IconButton(onPressed: (){
                  setState(() {
                    _selectedRole = "Admin";
                  });
                }, icon:Icon(Icons.admin_panel_settings, color: _selectedRole == "Admin" ? Colors.blue : Colors.grey)),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username",labelStyle: TextStyle(color: Colors.cyan) ,border: OutlineInputBorder(),fillColor: Colors.white, filled: true),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password",labelStyle: TextStyle(color: Colors.cyan), border: OutlineInputBorder(),fillColor: Colors.white, filled: true),
                obscureText: true,
              ),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,), onPressed: (){
              if(_usernameController.text.isEmpty || _passwordController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Lütfen tüm alanları doldurun")));
                return;
              }
              String? ad =_usernameController.text;
              String? sifre = _passwordController.text;
              KayitVeriTabani.kayitEkle(Kayitlar(ad,sifre,_selectedRole));//kayıt veritabanına yeni bir nesne ekliyoruz
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(role: _selectedRole,)));
            }, child: const Text("Register",style: TextStyle(color: Colors.white),), )
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}