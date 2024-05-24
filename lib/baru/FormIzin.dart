import 'package:elades/ApiService.dart';
import 'package:elades/baru/FormIzinFoto.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormIzin extends StatefulWidget {
  const FormIzin({super.key});

  @override
  State<FormIzin> createState() => _FormIzinState();
}

final ApiService apiService = ApiService();

class _FormIzinState extends State<FormIzin> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController ttlController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController wargaController = TextEditingController();
  TextEditingController tempatKerjaController = TextEditingController();
  TextEditingController bagianController = TextEditingController();
  TextEditingController alasanController = TextEditingController();
  TextEditingController tglIzinController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();
  TextEditingController alamatAnakController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController tempatlahirController = TextEditingController();
  TextEditingController tgllahirController = TextEditingController();
  String _selectedGender = 'Laki-laki';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Surat Izin'),
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

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 5, 0),
                      child: TextFormField(
                        controller: tempatlahirController,
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
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2999));

                          if (pickeddate != null) {
                            setState(() {
                              tgllahirController.text =
                                  DateFormat('dd-MM-yyy').format(pickeddate);
                            });
                          }
                        },
                        controller: tgllahirController,
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
                  controller: alamatController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    labelText: 'Alamat',
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

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: wargaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.flag),
                    labelText: 'Kewarganegaraan',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: agamaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.flag),
                    labelText: 'Agama',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: pekerjaanController,
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
                  controller: tempatKerjaController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: 'Tempat Kerja',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: bagianController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: 'Bagian',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: alasanController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.question_answer),
                    labelText: 'Alasan',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2999));

                    if (pickeddate != null) {
                      setState(() {
                        tglIzinController.text =
                            DateFormat('dd-MM-yyy').format(pickeddate);
                      });
                    }
                  },
                  controller: tglIzinController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: 'Tanggal Izin',
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
                    onTap: () {
                      alertBox(context, "Apakah semua data sudah benar?", "Pastikan semua data benar", Icons.warning, Colors.yellow, () { _kirimIzin(context);}, () { return;});
                      // _kirimIzin(context);
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

  void _kirimIzin(BuildContext context) async {
    UserModelBaru? user =
        Provider.of<UserProvider>(context, listen: false).userBaru;

    String NIK = nikController.text;
    String Nama = namaController.text;
    String jk = genderController.text;

    String tempat = tempatlahirController.text;
    String tglLahir = tgllahirController.text;

    String kwn = wargaController.text;
    String agm = agamaController.text;
    String krj = pekerjaanController.text;
    String alamat = alamatController.text;
    String tempatKerka = tempatKerjaController.text;
    String bagian = bagianController.text;
    String alasan = alasanController.text;
    String tanggal = tglIzinController.text;

    if (NIK.isEmpty ||
        Nama.isEmpty ||
        tempat.isEmpty ||
        tglLahir.isEmpty ||
        kwn.isEmpty ||
        agm.isEmpty ||
        krj.isEmpty ||
        alamat.isEmpty ||
        tempatKerka.isEmpty ||
        bagian.isEmpty ||
        alasan.isEmpty ||
        tanggal.isEmpty) {
      alert(context, "Lengkapi semua data terlebih dahulu");
    } else if(nikController.text.length<16){
      alert(context, "Panjang NIK harus 16 karakter");
    } else {
      try {
        Map<String, dynamic> response = await apiService.kirimSuratIzin(
            user!.username,
            NIK,
            Nama,
            jk,
            tempat + ", " + tglLahir,
            kwn,
            agm,
            krj,
            alamat,
            tempatKerka,
            bagian,
            alasan,
            tanggal);

        print('Response from server: $response'); // Cetak respons ke konsol

        if (response['status'] == 'success') {
          print('sukses mengirim');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FormIzinFoto(),
            ),
          );
          // Tambahkan logika navigasi atau tindakan setelah login berhasil

          // Set the user data using the provider

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => FormIzinFoto(),
          //   ),
          // );
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
        child: contentBox(context, message, title, icon, color, onYes, onNo),
      );
    },
  );
}

Widget contentBox(BuildContext context, String message, String title,
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
