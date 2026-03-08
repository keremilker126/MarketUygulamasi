import 'package:depouygulama/class/kayitlar.dart';
import 'package:depouygulama/class/kayitveritabani.dart';
import 'package:depouygulama/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        title: Center(child: const Text("Login Page", style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false
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
                }, icon: Icon(Icons.person, color: _selectedRole == "User" ? Colors.blue : Colors.grey),),
                IconButton(onPressed: (){
                  setState(() {
                    _selectedRole = "Admin";
                  });
                }, icon: Icon(Icons.admin_panel_settings, color: _selectedRole == "Admin" ? Colors.blue : Colors.grey)),
              ],
            ),
            SizedBox(height:  20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.cyan),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.cyan),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: (){
                String ad=_usernameController.text;
                String sifre=_passwordController.text;
                for(Kayitlar kayit in KayitVeriTabani.kayitlar.toList()){
                  if(kayit.username == ad && kayit.password == sifre && kayit.role == _selectedRole){ 
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(role: _selectedRole,)));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Bilgiler yanlış lütfen tekrar deneyin"))
                    );
                  }
                }
              },
              child: const Text("Login", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}