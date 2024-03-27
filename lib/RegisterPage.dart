import 'package:elades/ApiService.dart';
import 'package:elades/LoginPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  // final ApiService apiService = ApiService('http://localhost/path/to'); 
  // final ApiService apiService = ApiService('http://192.168.1.16:8080/coba/mobile'); // Sesuaikan dengan URL backend
  final ApiService apiService = ApiService();

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mendaftar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'No telp.',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_history),
                    labelText: 'Alamat',
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
                  onPressed: () {_register();},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(203,164,102, 1), // Ganti warna sesuai keinginan
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
            ],
          ),
        ),
      ),
    );
  }
void _register() async {
  String username = usernameController.text;
  String phone = phoneController.text;
  String address = addressController.text;
  String password = passwordController.text;
  String confirmPassword = confirmPasswordController.text;

  // Validasi form, misalnya memastikan semua field terisi dengan benar

  if (password == confirmPassword) {
    try {
      Map<String, dynamic> response = await apiService.register(username, password, phone);
      
      if (response['status'] == 'success') {
        print('Registration successful');
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
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
