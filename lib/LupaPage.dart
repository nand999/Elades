import 'package:elades/ApiService.dart';
import 'package:elades/LupaPageSandi.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class LupaPage extends StatefulWidget {
  const LupaPage({Key? key}) : super(key: key);

  @override
  State<LupaPage> createState() => _LupaPageState();
}

class _LupaPageState extends State<LupaPage> {
  // final ApiService apiService = ApiService('http://localhost/path/to');
  // final ApiService apiService = ApiService('http://192.168.1.16:8080/coba/mobile'); // Sesuaikan dengan URL backend
  final ApiService apiService = ApiService();
  EmailOTP myauth = EmailOTP();

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Sandi'),
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
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              SizedBox(height: 20.0),

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
                    myauth.setConfig(
                        appEmail: "codingnanda@gmail.com",
                        appName: "Elades",
                        userEmail: emailController.text,
                        otpLength: 6,
                        otpType: OTPType.digitsOnly);
                    if (await myauth.sendOTP() == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Kode OTP telah dikirimkan"),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Gagal mengirim kode OTP"),
                      ));
                    }
                  },
                  child: Center(
                    child: Text(
                      "Kirim kode OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Center(
                child: Text(
                  "Masukkan kode OTP anda:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 5),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color.fromRGBO(203, 164, 102, 1),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) async {
                  if (await myauth.verifyOTP(otp: verificationCode) == true) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP berhasil diverifikasi"),
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LupaPageSandi(
                          email: emailController.text,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP tidak valid"),
                    ));
                  }
                }, // end onSubmit
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
                    if (await myauth.verifyOTP(otp: otpController.text) ==
                        true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("OTP berhasil diverifikasi"),
                      ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LupaPageSandi(
                            email: emailController.text,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("OTP tidak valid"),
                      ));
                    }
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
