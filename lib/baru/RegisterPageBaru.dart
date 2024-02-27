import 'package:elades/ApiService.dart';
import 'package:elades/LoginPage.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:flutter/material.dart';

class RegisterPageBaru extends StatefulWidget {
  const RegisterPageBaru({Key? key}) : super(key: key);

  @override
  State<RegisterPageBaru> createState() => _RegisterPageBaruState();
}

class _RegisterPageBaruState extends State<RegisterPageBaru> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  // final ApiService apiService = ApiService('http://localhost/path/to');
  // final ApiService apiService = ApiService('http://192.168.1.16:8080/coba/mobile'); // Sesuaikan dengan URL backend
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

              SizedBox(height: 10.0),

              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
                child: ElevatedButton(
                  onPressed: () {
                    _register();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(
                        203, 164, 102, 1), // Ganti warna sesuai keinginan
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 16.0),
                        Text(
                          "Mendaftar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
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
    String phone = emailController.text;
    String notelp = telpController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String nama = NamaController.text;

    // Validasi form, misalnya memastikan semua field terisi dengan benar

    if (password == confirmPassword) {
      try {
        Map<String, dynamic> response =
            await apiService.registerBaru(username, password, phone, nama);

        if (response['status'] == 'success') {
          print('Registration successful');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginTerbaru(),
            ),
          );
        } else {
          print('Registration failed: ${response['message']}');
          // Tambahkan logika penanganan jika registrasi gagal
        }
      } catch (e) {
        print('Error during registration: $e');
        // Tambahkan logika penanganan jika terjadi error
      }
    } else {
      print('Password and confirm password do not match');
      // Tambahkan logika penanganan jika password dan konfirmasi tidak sesuai
    }
  }
}
