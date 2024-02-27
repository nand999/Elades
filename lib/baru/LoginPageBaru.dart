import 'package:elades/ApiService.dart';
import 'package:elades/BerandaPage.dart';
import 'package:elades/BerandaPageBaru.dart';
import 'package:elades/LupaPage.dart';
import 'package:elades/RegisterPage.dart';
import 'package:elades/baru/BerandaPageBaruBaru.dart';
import 'package:elades/baru/RegisterPageBaru.dart';
import 'package:elades/user_model.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

class LoginPageBaru extends StatelessWidget {
  // final ApiService apiService = ApiService('http://172.17.202.2:8080/coba/mobile');
  final ApiService apiService = ApiService();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Color hitam = const Color(0xff2e3654);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                child: Stack(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(203, 164, 102, 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(203, 164, 102, 1),
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Nama Pengguna",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Kata Sandi",
                                  //suffixIcon: IconButton(
                                  //   icon: Icon(
                                  //     isPasswordVisible
                                  //         ? Icons.visibility
                                  //         : Icons.visibility_off,
                                  //     color: Colors.grey,
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       isPasswordVisible = !isPasswordVisible;
                                  //     });
                                  //   },
                                  // ),
                                  hintStyle: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _login(context);
                          },
                          splashColor: Colors.grey,
                          hoverColor: Colors.grey,
                          child: Ink(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  hitam,
                                  hitam,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Masuk",
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
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _login(context);
                          },
                          splashColor: Colors.white,
                          hoverColor: Colors.white,
                          child: Ink(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey,
                                  Colors.grey,
                                ],
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 87,
                                ),
                                Text(
                                  "Masuk dengan Google",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset("assets/google.png")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                            duration: Duration(milliseconds: 1900),
                            child: Text("Belum punya akun? ")),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPageBaru(),
                              ),
                            );
                          },
                          child: FadeInUp(
                            duration: Duration(milliseconds: 1900),
                            child: Text(
                              "Daftar disini!",
                              style: TextStyle(
                                color: Color.fromRGBO(203, 164, 102, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LupaPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Lupa Sandi?",
                          style: TextStyle(
                            color: Color.fromRGBO(203, 164, 102, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// void _login(BuildContext context) async {
//   String username = usernameController.text;
//   String password = passwordController.text;

//   // Validasi form, misalnya memastikan semua field terisi dengan benar

//   try {
//     Map<String, dynamic> response = await apiService.loginBaru(username, password);

//     print('Response from server: $response'); // Cetak respons ke konsol

//     if (response['status'] == 'success') {
//       print('Login successful');
//       // Tambahkan logika navigasi atau tindakan setelah login berhasil

//             // Set the user data using the provider
//       context.read<UserProvider>().setUserBaru(
//         UserModelBaru(
//           username:  response['username'],
//           nama: response['nama'], // replace with the actual field name
//           foto_profil: response['foto_profil'],
//           email: response['email'],
//           kode_otp: response['kode_otp'],
//           created: response['created'],
//            // replace with the actual field name
//         ),
//       );

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BerandaPageBaru(),
//         ),
//       );
//     } else {
//       print('Login failed: ${response['message']}');
//       // Tambahkan logika penanganan jika login gagal
//     }
//   } catch (e) {
//     print('Error during login: $e');
//     // Tambahkan logika penanganan jika terjadi error
//   }
// }

  void _login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    // Validasi form, misalnya memastikan semua field terisi dengan benar

    try {
      Map<String, dynamic> response =
          await apiService.loginBaru(username, password);

      print('Response from server: $response'); // Cetak respons ke konsol

      if (response['status'] == 'success') {
        print('Login successful');
        // Tambahkan logika navigasi atau tindakan setelah login berhasil

        // Set the user data using the provider
        context.read<UserProvider>().setUserBaru(
              UserModelBaru(
                username: response['username'] ?? '',
                nama: response['nama'] ?? '',
                foto_profil: response['foto_profil'] ?? '',
                email: response['email'] ?? '',
                created: response['created'] ?? '',
                kode_otp: response['kode_otp'] ??
                    '', // Pastikan urutan parameter sesuai
              ),
            );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BerandaPageBaruBaru(),
          ),
        );
      } else {
        print('Login failed: ${response['message']}');
        // Tambahkan logika penanganan jika login gagal
      }
    } catch (e) {
      print('Error during login: $e');
      // Tambahkan logika penanganan jika terjadi error
    }
  }
}
