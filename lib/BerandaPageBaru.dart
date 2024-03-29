import 'package:elades/HomePage.dart';
import 'package:elades/HomePageBaru.dart';
import 'package:elades/baru/PengajuanSurat.dart';
import 'package:elades/ProdukPageBaru.dart';
import 'package:elades/ProfilPageBaru.dart';
import 'package:elades/SettingPage.dart';
import 'package:flutter/material.dart';

class BerandaPageBaru extends StatefulWidget {
  const BerandaPageBaru({Key? key}) : super(key: key);
  

  @override
  _BerandaPageBaruState createState() => _BerandaPageBaruState();
}

class _BerandaPageBaruState extends State<BerandaPageBaru> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageBaru(),
    ProdukPageBaru(),
    PengajuanSurat(),
    SettingPage(),
    ProfilPageBaru(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_currentIndex], // Main content
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff2e3654),
          selectedItemColor: Color.fromRGBO(203,164,102, 1),
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                // margin: EdgeInsets.only(bottom: 0.5),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(203,164,102, 1),
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      // _currentIndex = 2;
                      PopUpOptions.showOptions(context);
                    });
                  },
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_rounded),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  // void _onTabTapped(int index) {
  //   if (index == 2) {
  //     // Handle the plus button click
  //   } else if (index == 4) {
  //     // Handle the action for the last button (index 4)
  //     setState(() {
  //       _currentIndex = 2; // Index of ProfilPage
  //     });
  //   } else if (index >= 0 && index < _children.length) {
  //     setState(() {
  //       _currentIndex = index;
  //     });
  //   }
  // }

  void _onTabTapped(int index) {
    if (index == 2) {
      // _currentIndex = 0;
      // setState(() {
      //   PopUpOptions.showOptions(context);
      // });
      return;
      }

      setState(() {
        _currentIndex = index;
      });
    
  }
}

class PopUpOptions {
  static Future<void> showOptions(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.abc),
              title: Text('Option 1'),
              onTap: () {
                // Handle option 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.abc),
              title: Text('Option 2'),
              onTap: () {
                // Handle option 2
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.abc),
              title: Text('Option 3'),
              onTap: () {
                // Handle option 3
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
