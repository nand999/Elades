import 'package:elades/baru/LoginTerbaru.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';

class RegisterOtp extends StatefulWidget {
  final String username;
  final String email;
  final String noTelp;
  final String password;
  final String nama;

  const RegisterOtp({
    Key? key,
    required this.email,
    required this.nama,
    required this.noTelp,
    required this.password,
    required this.username,
  }) : super(key: key);

  @override
  State<RegisterOtp> createState() => _RegisterOtpState();
}

class _RegisterOtpState extends State<RegisterOtp> {
  TextEditingController otp = TextEditingController();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kode OTP'),
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: otp,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.security),
                          labelText: 'Kode OTP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        myauth.setConfig(
                            appEmail: "codingnanda@gmail.com",
                            appName: "Elades",
                            userEmail: widget.email,
                            otpLength: 6,
                            otpType: OTPType.digitsOnly);
                        if (await myauth.sendOTP() == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("OTP has been sent"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Oops, OTP send failed"),
                          ));
                        }
                      },
                      child: Text('Kirim Kode OTP'),
                    ),
                  ],
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
                    if (await myauth.verifyOTP(otp: otp.text) == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("OTP is verified"),
                      ));
                      // alert(context, "Silahkan Masuk", "Berhasil Mendaftar!",
                      //     Icons.check, Colors.green);

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LoginTerbaru(),
                      //   ),
                      // );
                      _register();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Invalid OTP"),
                      ));
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
    // Validasi form, misalnya memastikan semua field terisi dengan benar
    try {
      Map<String, dynamic> response = await apiService.registerBaru(
          widget.username, widget.password, widget.email, widget.noTelp, widget.nama);

      if (response['status'] == 'success') {
        print('Registration successful');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginTerbaru(),
          ),
        );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => RegisterOtp(),
        //   ),
        // );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => RegisterOtp(
        //       email: emailController.text,
        //       nama: NamaController.text,
        //       noTelp: telpController.text,
        //       password: passwordController.text,
        //       username: usernameController.text,
        //     ),
        //   ),
        // );

        alert(context, "Silahkan Masuk", "Berhasil Mendaftar!", Icons.check,
            Colors.green);
      } else {
        print('Registration failed: ${response['message']}');
        // Tambahkan logika penanganan jika registrasi gagal
      }
    } catch (e) {
      print('Error during registration: $e');
      // Tambahkan logika penanganan jika terjadi error
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
}
