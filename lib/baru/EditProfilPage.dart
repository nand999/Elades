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
                    onTap: () {},
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
}
