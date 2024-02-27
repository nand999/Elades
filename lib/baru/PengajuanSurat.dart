import 'package:flutter/material.dart';

class PengajuanSurat extends StatefulWidget {
  const PengajuanSurat({super.key});

  @override
  State<PengajuanSurat> createState() => _PengajuanSuratState();
}

class _PengajuanSuratState extends State<PengajuanSurat> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
        child: Column(
          children: [
            Card(
              color: Colors.grey.shade300,
              child: InkWell(
                onTap: () {
                  // Aksi yang ingin dijalankan saat card diklik
                },
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("akun"),
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: InkWell(
                onTap: () {
                  // Aksi yang ingin dijalankan saat card diklik
                },
                child: ListTile(
                  leading: Icon(Icons.shop_two),
                  title: Text("belanja"),
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: InkWell(
                onTap: () {
                  // Aksi yang ingin dijalankan saat card diklik
                },
                child: ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text("alamat"),
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: InkWell(
                onTap: () {
                  // Aksi yang ingin dijalankan saat card diklik
                },
                child: ListTile(
                  leading: Icon(Icons.view_agenda),
                  title: Text("tampilan"),
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: InkWell(
                onTap: () {
                  // Aksi yang ingin dijalankan saat card diklik
                },
                child: ListTile(
                  leading: Icon(Icons.sunny),
                  title: Text("kocak"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}