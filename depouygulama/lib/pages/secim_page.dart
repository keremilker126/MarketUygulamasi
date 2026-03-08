import 'package:depouygulama/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:depouygulama/pages/register_page.dart';
class SecimPage extends StatefulWidget {
  const SecimPage({super.key});

  @override
  State<SecimPage> createState() => _SecimPageState();
}

class _SecimPageState extends State<SecimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Seçim Sayfası", style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              
              child: SizedBox(
                width: 200,
                child: Card(
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Center(child: Icon(Icons.login, color: Colors.white, size: 40)),
                        Center(child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: SizedBox(
                width: 200,
                child: Card(
                  color: Colors.blueAccent,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Center(child: Icon(Icons.person_add, color: Colors.white, size: 40)),
                        Center(child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 18))),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}