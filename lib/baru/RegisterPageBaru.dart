import 'package:elades/ApiService.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:elades/baru/RegisterOtp.dart';
import 'package:flutter/material.dart';

class RegisterPageBaru extends StatefulWidget {
  const RegisterPageBaru({Key? key}) : super(key: key);

  @override
  State<RegisterPageBaru> createState() => _RegisterPageBaruState();
}

class _RegisterPageBaruState extends State<RegisterPageBaru> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final ApiService apiService = ApiService();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController NamaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mendaftar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Textfield dengan Prefix Icon dan Box Line
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
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: NamaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: telpController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'No. Telp',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Kata Sandi',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Konfirmasi Kata Sandi',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Ink(
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
                child: InkWell(
                  onTap: () {
                    if (usernameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        telpController.text.isEmpty ||
                        usernameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty ||
                        NamaController.text.isEmpty) {
                      alert(context, "Isi semua data terlebih dahulu",
                          "Gagal mendaftar!", Icons.error, Colors.red);
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      alert(context, "Sandi dan konfirmasi sandi tidak sesuai",
                          "Gagal mendaftar!", Icons.error, Colors.red);
                    } else if (passwordController.text.length < 8 ||
                        confirmPasswordController.text.length < 8) {
                      alert(context, "Panjang sandi minimal 8 karakter",
                          "Gagal mendaftar!", Icons.error, Colors.red);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterOtp(
                            email: emailController.text,
                            nama: NamaController.text,
                            noTelp: telpController.text,
                            password: passwordController.text,
                            username: usernameController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      "Mendaftar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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

  void _register() async {
    String username = usernameController.text;
    String email = emailController.text;
    String notelp = telpController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String nama = NamaController.text;

    // Validasi form, misalnya memastikan semua field terisi dengan benar
    if (username.isEmpty ||
        email.isEmpty ||
        notelp.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        nama.isEmpty) {
      // Tampilkan pesan alert jika ada field yang kosong
      alert(context, "Harap lengkapi semua data.", "gagal mendaftar!",
          Icons.error, Colors.red);
      return;
    } else if (password == confirmPassword) {
      try {
        Map<String, dynamic> response = await apiService.registerBaru(
            username, password, email, notelp, nama);

        if (response['status'] == 'success') {
          print('Registration successful');

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => LoginTerbaru(),
          //   ),
          // );

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => RegisterOtp(),
          //   ),
          // );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterOtp(
                email: emailController.text,
                nama: NamaController.text,
                noTelp: telpController.text,
                password: passwordController.text,
                username: usernameController.text,
              ),
            ),
          );

          // alert(context, "Silahkan Masuk", "Berhasil Mendaftar!", Icons.check,
          //     Colors.green);
        } else {
          print('Registration failed: ${response['message']}');
          // Tambahkan logika penanganan jika registrasi gagal
        }
      } catch (e) {
        print('Error during registration: $e');
        // Tambahkan logika penanganan jika terjadi error
      }
    } else {
      alert(context, "Sandi dan konfirmasi sandi tidak sesuai.",
          "gagal mendaftar!", Icons.error, Colors.red);
    }
  }
}

void alert(BuildContext context, String message, String title, IconData icon,
    Color color) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context, message, title, icon, color),
      );
    },
  );
}

Widget contentBox(BuildContext context, String message, String title,
    IconData icon, Color color) {
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          left: 20,
          top: 45,
          right: 20,
          bottom: 20,
        ),
        margin: EdgeInsets.only(top: 45),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 22),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OKE',
                  style: TextStyle(color: Color.fromRGBO(203, 164, 102, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        left: 20,
        right: 20,
        child: CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    ],
  );
}
