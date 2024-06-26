import 'package:elades/ApiService.dart';
import 'package:elades/NotifPage2.dart';
import 'package:elades/baru/HomePageBaruBaru.dart';
import 'package:elades/baru/PengajuanPage.dart';
import 'package:elades/baru/PengajuanSurat.dart';
import 'package:elades/baru/PeringatanPage.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:provider/provider.dart';
import 'ProfilPageBaruBaru.dart';
import 'package:flutter/material.dart';

class BerandaPageBaruBaru extends StatefulWidget {
  const BerandaPageBaruBaru({Key? key}) : super(key: key);

  @override
  _BerandaPageBaruBaruState createState() => _BerandaPageBaruBaruState();
}

class _BerandaPageBaruBaruState extends State<BerandaPageBaruBaru> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageBaruBaru(),
    PengajuanPage(),
    PengajuanSurat(),
    // SettingPage(),
    NotifPage2(),
    ProfilPageBaruBaru(),
  ];

    String _getGreeting(DateTime now) {
    var hour = now.hour ;
    print("SEKARANG ADALAH JAM: "+ hour.toString());
    if (hour < 10) {
      return "Selamat Pagi!";
    } else if (hour < 15) {
      return "Selamat Siang!";
    } else if (hour < 18) {
      return "Selamat Sore!";
    } else {
      return "Selamat Malam!";
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    UserModelBaru? user = context.watch<UserProvider>().userBaru;
    var now = DateTime.now();
    var greeting = _getGreeting(now);

    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _currentIndex == 0
            ? AppBar(
                backgroundColor: Color(0xff2e3654),
                title: Text(
                  "$greeting " + user!.username.toString(),
                  style: TextStyle(color: Color.fromRGBO(203, 164, 102, 1)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                leading: InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: user != null && user!.foto_profil != null
                        ? ClipOval(
                            child: Image.network(
                              apiService.fotoProfilUrl + user!.foto_profil!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print('Error loading image: $error');
                                return Image.asset(
                                  'assets/nullPP.jpg',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              'assets/nullPP.jpg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              )
            : null,
        body: _children[_currentIndex], // Main content
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff2e3654),
          selectedItemColor: Color.fromRGBO(203, 164, 102, 1),
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
                  color: Color.fromRGBO(203, 164, 102, 1),
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
              leading: Icon(Icons.mail_rounded),
              title: Text('Pengantar SKCK'),
              onTap: () {
                // Handle option 1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeringatanPage(
                      kodeSurat: "skck",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_rounded),
              title: Text('Surat Keteranan Tidak Mampu'),
              onTap: () {
                // Handle option 2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeringatanPage(
                      kodeSurat: "sktm",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_rounded),
              title: Text('Surat Izin'),
              onTap: () {
                // Handle option 3
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeringatanPage(
                      kodeSurat: "izin",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_rounded),
              title: Text('Surat Kematian'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeringatanPage(
                      kodeSurat: "kematian",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_rounded),
              title: Text('Surat Keterangan Penghasilan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeringatanPage(
                      kodeSurat: "penghasilan",
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
  
}
