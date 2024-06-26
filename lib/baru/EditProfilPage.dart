import 'package:elades/ApiService.dart';
import 'package:elades/baru/EditProfilEmail.dart';
import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:flutter/material.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormEditProfil extends StatefulWidget {
  const FormEditProfil({super.key});

  @override
  State<FormEditProfil> createState() => _FormEditProfilState();
}

class _FormEditProfilState extends State<FormEditProfil> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Hapus penggunaan context.watch di sini
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pindahkan penggunaan context.watch ke sini
    UserModelBaru? user = context.watch<UserProvider>().userBaru;
    // Set nilai awal pada TextField di sini
    usernameController.text = user?.username ?? "";
    namaController.text = user?.nama ?? "";
    noController.text = user?.noHp ?? "Anda belum menambahkan Nomor Telepon";
    emailController.text = user?.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    // Tetapkan variabel user di dalam metode build jika diperlukan
    UserModelBaru? user = context.watch<UserProvider>().userBaru;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Color.fromRGBO(203, 164, 102, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: noController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.male),
                    labelText: 'No Hp',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.male),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      try {
                        // Pengecekan apakah email baru tidak sama dengan email yang sudah ada
                        if (user!.email != emailController.text) {
                          ApiService apiService = ApiService();
                          // Pengecekan apakah email baru sudah terdaftar
                          Map<String, dynamic> emailResult =
                              await apiService.cekEmail(emailController.text);

                          if (emailResult['status'] == 'available') {
                            // Jika email tersedia
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilEmail(
                                  nama: namaController.text,
                                  username: usernameController.text,
                                  noHp: noController.text,
                                  email: emailController.text,
                                ),
                              ),
                            );
                          } else {
                            // Jika email sudah terdaftar
                            // Tampilkan pesan bahwa email sudah terdaftar
                            alert(context, "Email sudah terdaftar");
                          }
                        } else {
                          // Jika email baru sama dengan email yang sudah ada
                          _editProfil(context);
                        }
                      } catch (e) {
                        print('Error during email validation: $e');
                        // Tambahkan penanganan error jika terjadi masalah saat memeriksa email
                        alert(context, "Gagal mengubah email");
                      }
                    },
                    splashColor: Color(0xff2e3654),
                    hoverColor: Color(0xff2e3654),
                    child: Ink(
                      height: 50,
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
                        child: Text(
                          "Berikutnya",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 void _editProfil(BuildContext context) async {
  final ApiService apiService = ApiService();

  UserModelBaru? user =
      Provider.of<UserProvider>(context, listen: false).userBaru;

  String usernameBaru = usernameController.text;
  String Nama = namaController.text;
  String no = noController.text;
  String email = emailController.text;

  // Validasi form, misalnya memastikan semua field terisi dengan benar

  try {
    // Pengecekan apakah username baru tidak sama dengan username yang sudah ada
    if (user!.username != usernameBaru) {
      // Pengecekan apakah username baru sudah terdaftar
      Map<String, dynamic> usernameResult =
          await apiService.cekUsername(usernameBaru);

      if (usernameResult['status'] == 'available') { // Jika username tersedia
        // Lakukan pembaruan profil
        Map<String, dynamic> response = await apiService.updateProfil(
            user.username, usernameBaru, Nama, no, email);

        print('Response from server: $response'); // Cetak respons ke konsol

        if (response['status'] == 'success') {
          print('sukses mengirim');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginTerbaru(),
            ),
          );
          // Tambahkan logika navigasi atau tindakan setelah login berhasil

          // Set the user data using the provider
        } else if (response['status'] == 'errorValid') {
          // Tambahkan logika jika validasi gagal
        } else {
          print('Login failed: ${response['message']}');
        }
      } else { // Jika username sudah terdaftar
        // Tampilkan pesan bahwa username sudah terdaftar
        alert(context, "Username sudah terdaftar");
      }
    } else { // Jika username baru sama dengan username yang sudah ada
      // Lakukan pembaruan profil tanpa melakukan pengecekan username
      Map<String, dynamic> response = await apiService.updateProfil(
          user.username, usernameBaru, Nama, no, email);

      print('Response from server: $response'); // Cetak respons ke konsol

      if (response['status'] == 'success') {
        print('sukses mengirim');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginTerbaru(),
          ),
        );
        // Tambahkan logika navigasi atau tindakan setelah login berhasil

        // Set the user data using the provider
      } else if (response['status'] == 'errorValid') {
        // Tambahkan logika jika validasi gagal
      } else {
        print('Login failed: ${response['message']}');
      }
    }
  } catch (e) {
    print('Error during login: $e');
    // Tambahkan logika penanganan jika terjadi error
  }
}

}
