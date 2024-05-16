import 'package:elades/ApiService.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:flutter/material.dart';

class LupaPageSandi extends StatefulWidget {
  final String email;
  // const LupaPageSandi({Key? key}) : super(key: key);
  const LupaPageSandi({Key? key, required this.email}) : super(key: key);

  @override
  State<LupaPageSandi> createState() => _LupaPageSandiState();
}

class _LupaPageSandiState extends State<LupaPageSandi> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final ApiService apiService = ApiService();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset sandi'),
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
                  onTap: () async {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      alert(
                          context,
                          "Kata sandi dan konfirmasi sandi tidak sesuai!",
                          "Gagal mengubah sandi",
                          Icons.error,
                          Colors.red);
                    } else if (passwordController.text.length < 8 ||
                        confirmPasswordController.text.length < 8) {
                      alert(
                          context,
                          "Panjang sandi minimal 8 karakter",
                          "Gagal melanjutkan proses lupa sandi! ",
                          Icons.error,
                          Colors.red);
                    } else {
                      try {
                        
                        Map<String, dynamic> result = await ApiService()
                            .updateSandi(
                                widget.email, confirmPasswordController.text);

                        // Lakukan penanganan hasil jika diperlukan
                        print('Update successful: $result');

                        // Tambahkan navigasi atau tindakan lain setelah berhasil diunggah
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginTerbaru(),
                          ),
                        );
                      } catch (e) {
                        print('Error uploading image: $e');
                        // Tambahkan penanganan kesalahan jika diperlukan
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      "Ubah Sandi",
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
}
