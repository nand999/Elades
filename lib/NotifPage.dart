import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 5),
        child: Column(
          children: [
            Card(
              color: Colors.grey.shade300,
              child: InkWell(
                onTap: () {
                  // Aksi yang ingin dijalankan saat card diklik
                },
                child: ListTile(
                  leading: Icon(Icons.check),
                  title: Text("notif 1"),
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
                  leading: Icon(Icons.not_interested_rounded),
                  title: Text("notif 2"),
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
                  leading: Icon(Icons.check),
                  title: Text("notif 3"),
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
                  leading: Icon(Icons.check),
                  title: Text("notif 4"),
                ),
              ),
            ),

            // Card(
            //   color: Colors.grey.shade300,
            //   child: InkWell(
            //     onTap: () {
            //       // Aksi yang ingin dijalankan saat card diklik
            //     },
            //     child: ListTile(
            //       leading: Icon(Icons.shop_two),
            //       title: Text("belanja"),
            //     ),
            //   ),
            // ),
            // Card(
            //   color: Colors.grey.shade300,
            //   child: InkWell(
            //     onTap: () {
            //       // Aksi yang ingin dijalankan saat card diklik
            //     },
            //     child: ListTile(
            //       leading: Icon(Icons.location_city),
            //       title: Text("alamat"),
            //     ),
            //   ),
            // ),
            // Card(
            //   color: Colors.grey.shade300,
            //   child: InkWell(
            //     onTap: () {
            //       // Aksi yang ingin dijalankan saat card diklik
            //     },
            //     child: ListTile(
            //       leading: Icon(Icons.view_agenda),
            //       title: Text("tampilan"),
            //     ),
            //   ),
            // ),
            // Card(
            //   color: Colors.grey.shade300,
            //   child: InkWell(
            //     onTap: () {
            //       // Aksi yang ingin dijalankan saat card diklik
            //     },
            //     child: ListTile(
            //       leading: Icon(Icons.sunny),
            //       title: Text("kocak"),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
