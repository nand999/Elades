import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                         // Ganti nilai sesuai keinginan Anda
                      ),
                      child: Image(image: AssetImage("assets/galaxy.jpg"), width: 200, height: 200, fit: BoxFit.fill,),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Ganti warna sesuai keinginan Anda
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          // Implement logic to change the profile photo
                          _changePhoto(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Informasi Profil
            UserInfoCard(
              name: 'John Doe',
              email: 'johndoe@example.com',
              address: 'Jl. Contoh No. 123',
            ),
          ],
        ),
      ),
    );
  }

  void _changePhoto(BuildContext context) {
    // Implement logic to change the profile photo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ganti Foto Profil'),
          content: Text('Implement logic to change the profile photo here.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String address;

  const UserInfoCard({Key? key, required this.name, required this.email, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $name', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Email: $email', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Alamat: $address', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
