import 'package:elades/ApiService.dart';
import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:elades/baru/formSkckFoto.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormSkck extends StatefulWidget {
  const FormSkck({super.key});

  @override
  State<FormSkck> createState() => _FormSkckState();
}

class _FormSkckState extends State<FormSkck> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController tmpController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController kebangController = TextEditingController();
  TextEditingController agaController = TextEditingController();
  TextEditingController jkController = TextEditingController();
  TextEditingController stKawinController = TextEditingController();
  TextEditingController pekerController = TextEditingController();
  TextEditingController tempTglController = TextEditingController();

  String _selectedGender = 'Laki-laki';
  String _statusPerkawinan = 'Belum kawin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengantar SKCK'),
        backgroundColor: Color.fromRGBO(203, 164, 102, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Textfield dengan Prefix Icon dan Box Line

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                child: Center(
                    child: Text(
                  'Data Diri:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: namaController,
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
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: 'NIK',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Text(
                  'Tempat Tanggal Lahir:',
                  style: TextStyle(fontSize: 15),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 5, 0),
                      child: TextFormField(
                        controller: tmpController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          labelText: 'Tempat',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 10, 0),
                      child: TextFormField(
                        onTap: () async {
                          DateTime? pickeddateBp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2999));

                          if (pickeddateBp != null) {
                            setState(() {
                              tglController.text =
                                  DateFormat('dd-MM-yyy').format(pickeddateBp);
                            });
                          }
                        },
                        controller: tglController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          labelText: 'Tanggal',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: kebangController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.flag),
                    labelText: 'Kebangsaan',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: agaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mosque),
                    labelText: 'Agama',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              //   child: TextFormField(
              //     controller: stKawinController,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(Icons.woman),
              //       labelText: 'Status Perkawinan',
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: DropdownButtonFormField<String>(
                  value: _statusPerkawinan,
                  decoration: InputDecoration(
                    labelText: 'Status Perkawinan',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _statusPerkawinan = newValue!;
                    });
                  },
                  items: <String>[
                    'Belum kawin',
                    'Kawin belum tercatat',
                    'Kawin tercatat',
                    'Cerai hidup',
                    'Cerai mati'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(
                            value == 'Belum kawin' ? Icons.male : Icons.female,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: pekerController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: 'Pekerjaan',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: tempTglController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    labelText: 'Tempat Tinggal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                    });
                  },
                  items: <String>['Laki-laki', 'Perempuan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(
                            value == 'Laki-laki' ? Icons.male : Icons.female,
                            color: Colors
                                .black, // Sesuaikan dengan warna yang diinginkan
                          ),
                          SizedBox(width: 10), // Sesuaikan dengan kebutuhan
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 30.0),

              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      alertBox(context, "Apakah semua data sudah benar?", "Pastikan semua data benar", Icons.warning, Colors.yellow, () { _kirimSkck(context);}, () { return;});
                      // _kirimSkck(context);
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

  void _kirimSkck(BuildContext context) async {
    UserModelBaru? user =
        Provider.of<UserProvider>(context, listen: false).userBaru;

    String nama = namaController.text;
    String nik = nikController.text;
    String tempatLahir = tmpController.text;
    String tglLahir = tglController.text;

    String statusKawin = stKawinController.text;
    String agama = agaController.text;
    String pekerjaan = pekerController.text;
    String kebangsaan = kebangController.text;

    String tempatTinggal = tempTglController.text;
    String jk = _selectedGender;

    if (nama.isEmpty ||
        nik.isEmpty ||
        tempatLahir.isEmpty ||
        tglLahir.isEmpty ||
        agama.isEmpty ||
        pekerjaan.isEmpty ||
        kebangsaan.isEmpty ||
        tempatTinggal.isEmpty) {
      alert(context, "Lengkapi semua data terlebih dahulu!");
    } else if (nikController.text.length < 16) {
      alert(context, "Panjang NIK harus 16 karakter");
    } else {
      try {
        ApiService apiService = ApiService();
        Map<String, dynamic> response = await apiService.kirimSkck(
          user!.username,
          nama,
          nik,
          tempatLahir + ", " + tglController.text,
          kebangsaan,
          pekerjaan,
          agama,
          jk,
          _statusPerkawinan,
          tempatTinggal,
        );

        print('Response from server: $response'); // Cetak respons ke konsol

        if (response['status'] == 'success') {
          print('sukses mengirim');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FormSkckFoto(),
            ),
          );
        } else if (response['status'] == 'errorValid') {
        } else {
          print('Login failed: ${response['message']}');
        }
      } catch (e) {
        print('Error during login: $e');
        // Tambahkan logika penanganan jika terjadi error
      }
    }
  }
    void alertBox(BuildContext context, String message, String title, IconData icon,
    Color color, VoidCallback onYes, VoidCallback onNo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox1(context, message, title, icon, color, onYes, onNo),
      );
    },
  );
}

Widget contentBox1(BuildContext context, String message, String title,
    IconData icon, Color color, VoidCallback onYes, VoidCallback onNo) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: onNo,
                  child: Text(
                    'TIDAK',
                    style: TextStyle(color: Color.fromRGBO(203, 164, 102, 1)),
                  ),
                ),
                TextButton(
                  onPressed: onYes,
                  child: Text(
                    'YA',
                    style: TextStyle(color: Color.fromRGBO(203, 164, 102, 1)),
                  ),
                ),
              ],
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
