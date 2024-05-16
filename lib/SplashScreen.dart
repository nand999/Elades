import 'dart:async';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tunggu selama 3 detik, kemudian pindah ke halaman LoginTerbaru
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginTerbaru()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image atau color bisa ditambahkan di sini
          // Misalnya:
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/background.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Letakkan logo di tengah layar
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 350, // Atur lebar sesuai kebutuhan
                  height: 350, // Atur tinggi sesuai kebutuhan
                ),
              ),
              Center(
                child: Text("Developer Nox team"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
