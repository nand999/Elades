import 'dart:io';
import 'package:elades/ApiService.dart';
import 'package:elades/baru/DetailPP.dart';
import 'package:elades/baru/EditProfilPage.dart';
import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/LoginTerbaru.dart' hide apiService;
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return detailPP();
                      }));
                    },
                    child: Hero(
                      tag: "PP",
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xff2e3654), // Warna hitam
                            width: 2, // Lebar border
                          ),
                        ),
                        child: user != null && user.foto_profil != null
                            ? ClipOval(
                                child: Image.network(
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
                                ),
                              )
                            : ClipOval(
                                child: Image.asset(
                                  'assets/nullPP.jpg',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(203, 164, 102,
                            1), // Ganti warna sesuai keinginan Anda
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
              username: user!.username,
              name: user!.nama,
              email: user!.email,
              noHp: user!.noHp,
              address: user.kode_otp.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String username;
  final String name;
  final String email;
  final String noHp;
  final String address;

  const UserInfoCard({
    Key? key,
    required this.username,
    required this.name,
    required this.email,
    required this.noHp,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            // border: Border.all(color: Color(0xff2e3654))
            ),
        height: 400,
        width: 300,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Userame: $username', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Nama: $name', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Email: $email', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('No Hp: $noHp', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              // Text('Alamat: $address', style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormEditProfil(),
                        ),
                      );
                    },
                    splashColor: Color(0xff2e3654),
                    hoverColor: Color(0xff2e3654),
                    child: Ink(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(203, 164, 102, 1),
                            Color.fromRGBO(203, 164, 102, 1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit, color: Colors.white),
                            SizedBox(width: 5), // Sesuaikan dengan kebutuhan
                            Text(
                              "Edit Profil",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Konfirmasi"),
                            content: Text("Yakin untuk menghapus akun Anda?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Tutup dialog
                                },
                                child: Text("Tidak"),
                              ),
                              TextButton(
                                onPressed: () {
                                  UserModelBaru? user =
                                      context.read<UserProvider>().userBaru;
                                  apiService.hapusAkun(user!.username);
                                  Navigator.of(context).pop();
                                  // Tutup dialog setelah menghapus
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginTerbaru(),
                                    ),
                                  );
                                },
                                child: Text("Ya"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    splashColor: Color(0xff2e3654),
                    hoverColor: Color(0xff2e3654),
                    child: Ink(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.redAccent,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                            SizedBox(width: 5), // Sesuaikan dengan kebutuhan
                            Text(
                              "Hapus Akun",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 162,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginTerbaru(),
                            ),
                          );
                        },
                        splashColor: Color(0xff2e3654),
                        hoverColor: Color(0xff2e3654),
                        child: Ink(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.red,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.logout, color: Colors.white),
                                  SizedBox(
                                      width: 5), // Sesuaikan dengan kebutuhan
                                  Text(
                                    "Keluar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;
    path.addOval(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
