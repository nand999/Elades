import 'dart:io';
import 'package:elades/ApiService.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:elades/user_provider.dart';
import 'package:uuid/uuid.dart';

class ProfilPageBaruBaru extends StatefulWidget {
  const ProfilPageBaruBaru({Key? key}) : super(key: key);

  @override
  State<ProfilPageBaruBaru> createState() => _ProfilPageBaruBaruState();
}

class _ProfilPageBaruBaruState extends State<ProfilPageBaruBaru> {
  ApiService apiService = ApiService();
  File? image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagepicked =
        await _picker.pickImage(source: ImageSource.gallery);

    // Periksa apakah pengguna memilih foto atau membatalkan
    if (imagepicked != null) {
      image = File(imagepicked.path);
      setState(() {});
    } else {
      // Pengguna membatalkan pemilihan, tidak ada perubahan yang perlu di-handle
    }
  }

  Future<void> _changePhoto() async {
    await getImage();
    if (image != null) {
      try {
        await updateFotoProfil(image!);
        setState(() {
          // Tambahkan logika pembaruan data user setelah foto profil berhasil diperbarui
          UserModelBaru? updatedUser = context.read<UserProvider>().userBaru;
          if (updatedUser != null) {
            context.read<UserProvider>().setUserBaru(updatedUser);
          }
        });
        // Navigator.pop(context);
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => ProfilPageBaruBaru()));
      } catch (e) {
        // Tampilkan pesan kesalahan jika gagal mengupdate foto profil
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to update foto profil.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  //lama

  // Future<void> _changePhoto() async {
  //   await getImage();
  //   if (image != null) {
  //     try {
  //       await updateFotoProfil(image!);
  //       setState(() {

  //       });
  //     } catch (e) {
  //       // Tampilkan pesan kesalahan jika gagal mengupdate foto profil
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Error'),
  //             content: Text('Failed to update foto profil.'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('Close'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   }
  // }

  Future<void> updateFotoProfil(File image) async {
    UserModelBaru? user = context.read<UserProvider>().userBaru;
    if (user != null) {
      try {
        bool uploadSuccess = await uploadImage(image);

        if (uploadSuccess) {
          await apiService.updateFotoProfilBaru(
              user.username!, image); // Perubahan di sini
          print('Update foto_profil success ' + user.username.toString());
          setState(() {
            UserModelBaru? updatedUser = context.read<UserProvider>().userBaru;
            if (updatedUser != null) {
              context.read<UserProvider>().setUserBaru(updatedUser);
            }
          });
          // Lakukan tindakan tambahan jika diperlukan setelah berhasil memperbarui foto profil
        } else {
          print('Failed to update foto_profil');
        }
      } catch (e) {
        print('Error updating foto_profil: $e');
      }
    }
  }

  //    lama 2
  // Future<void> updateFotoProfil(File image) async {
  //   UserModel? user = context.read<UserProvider>().user;
  //   if (user != null) {
  //     try {
  //       bool uploadSuccess = await uploadImage(image);

  //       if (uploadSuccess) {
  //         print('Update foto_profil success '+ user.id.toString());
  //         // Lakukan tindakan tambahan jika diperlukan setelah berhasil memperbarui foto profil
  //       } else {
  //         print('Failed to update foto_profil');
  //       }
  //     } catch (e) {
  //       print('Error updating foto_profil: $e');
  //     }
  //   }
  // }

  Future<bool> uploadImage(File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(apiService.baseUrl + '/upload.php'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          image.path,
          filename:
              Uuid().v4() + ".jpg", // Generate a random filename using uuid
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        // Gambar berhasil diunggah. Sekarang perbarui foto_profil di tabel pengguna.
        return true;
      } else {
        print('Failed to upload image. Server error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModelBaru? user = context.watch<UserProvider>().userBaru;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                          // Ganti nilai sesuai keinginan Anda
                          ),
                      child: user != null && user.foto_profil != null
                          ? Image.network(
                              apiService.fotoProfilUrl + user.foto_profil,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print('Error loading image: $error');
                                return Image.asset(
                                  'assets/nullPP.jpg',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/nullPP.jpg',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
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
                        onPressed: () async {
                          await _changePhoto();
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
              name: user!.nama,
              email: user!.email,
              address: user.kode_otp.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String address;

  const UserInfoCard({
    Key? key,
    required this.name,
    required this.email,
    required this.address,
  }) : super(key: key);

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
