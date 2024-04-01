import 'package:elades/baru/BerandaPageBaruBaru.dart';
import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/FormKematian.dart';
import 'package:elades/baru/FormPenghasilan.dart';
import 'package:elades/baru/FormSktm.dart';
import 'package:flutter/material.dart';

class PeringatanBerhasilPage extends StatefulWidget {
  const PeringatanBerhasilPage({super.key});

  @override
  State<PeringatanBerhasilPage> createState() => _PeringatanBerhasilPageState();
}

class _PeringatanBerhasilPageState extends State<PeringatanBerhasilPage> {
  // String jenisSurat;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Pengajuan Surat Berhasil',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 250,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff2e3654),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Pengajuan anda berhasil ditambahkan, silahkan cek berkala riwayat pengajuan untuk melihat status pengajuan anda.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BerandaPageBaruBaru(),
                        ),
                      );
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
}
