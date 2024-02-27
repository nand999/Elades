import 'package:elades/HomePage.dart';
import 'package:elades/ProdukPage.dart';
import 'package:elades/ProdukPageBaru.dart';
import 'package:elades/ProfilPageBaru.dart';
import 'package:elades/SettingPage.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
   BerandaPage({super.key});
  Color kuning = Color.fromRGBO(203,164,102, 1);
  Color hitam = const Color(0xff2e3654);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Aplikasi Saya"),
              bottom: TabBar(
                indicatorColor:kuning,
                labelColor: kuning,
                tabs: <Widget>[
                Tab(
                  icon: (Icon(Icons.account_balance)),
                ),
                Tab(
                  icon: (Icon(Icons.shop)),
                ),
                Tab(
                  icon: (Icon(Icons.person)),
                ),
                Tab(
                  icon: (Icon(Icons.settings)),
                ),
              ]),
            ),
            body: TabBarView(children: <Widget> [
              HomePage(),
              ProdukPageBaru(),
              ProfilPageBaru(),
              SettingPage()
            ]),
          )
          ),
    );
  }
}
