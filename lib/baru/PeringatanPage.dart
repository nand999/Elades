import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/FormKematian.dart';
import 'package:elades/baru/FormPenghasilan.dart';
import 'package:elades/baru/FormSktm.dart';
import 'package:elades/baru/formSkck.dart';
import 'package:flutter/material.dart';

class PeringatanPage extends StatefulWidget {
  final String kodeSurat;
  const PeringatanPage({super.key, required this.kodeSurat});

  @override
  State<PeringatanPage> createState() => _PeringatanPageState();
}

class _PeringatanPageState extends State<PeringatanPage> {
  // String jenisSurat;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Persiapkan Dokumen Anda',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ktp.png', // Ganti dengan path gambar sesuai dengan struktur proyek Anda
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff2e3654),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Sebelum ke proses berikutnya, dimohon untuk menyiapkan dokumen-dokumen yang diperlukan (KTP, KK, dan dokumen pelengkap lainnya).',
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
                      if (widget.kodeSurat == "sktm") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormSktm(),
                          ),
                        );
                      } else  if (widget.kodeSurat == "skck") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormSkck(),
                          ),
                        );
                      }else  if (widget.kodeSurat == "izin") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormIzin(),
                          ),
                        );
                      } else  if (widget.kodeSurat == "kematian") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormKematian(),
                          ),
                        );
                      } else  if (widget.kodeSurat == "penghasilan") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPenghasilan(),
                          ),
                        );
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
}
