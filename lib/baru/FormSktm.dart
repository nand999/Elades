import 'package:elades/ApiService.dart';
import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/FormSktmFoto.dart';
import 'package:elades/baru/LoginTerbaru.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormSktm extends StatefulWidget {
  const FormSktm({super.key});

  @override
  State<FormSktm> createState() => _FormSktmState();
}

class _FormSktmState extends State<FormSktm> {
  TextEditingController bapakController = TextEditingController();
  TextEditingController tmpBapakController = TextEditingController();
  TextEditingController tglBapakController = TextEditingController();
  TextEditingController kerjaBapController = TextEditingController();
  TextEditingController alamatBapakController = TextEditingController();
  TextEditingController ibuController = TextEditingController();
  TextEditingController tmpIbuController = TextEditingController();
  TextEditingController tglIbuController = TextEditingController();
  TextEditingController kerjaIbuController = TextEditingController();
  TextEditingController alamatIbuController = TextEditingController();
  TextEditingController anakController = TextEditingController();
  TextEditingController tmpAnakController = TextEditingController();
  TextEditingController tglAnakController = TextEditingController();
  TextEditingController kelaminController = TextEditingController();
  TextEditingController alamatAnakController = TextEditingController();

  String _selectedGender = 'Laki-laki';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form SKTM'),
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
                  'Data Bapak:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: bapakController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Nama Bapak',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Text(
                  'Tempat Tanggal Lahir Bapak:',
                  style: TextStyle(fontSize: 15),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 5, 0),
                      child: TextFormField(
                        controller: tmpBapakController,
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
                              tglBapakController.text =
                                  DateFormat('dd-MM-yyy').format(pickeddateBp);
                            });
                          }
                        },
                        controller: tglBapakController,
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
                  controller: kerjaBapController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: 'Pekerjaan Bapak',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: alamatBapakController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    labelText: 'Alamat Bapak',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                child: Center(
                    child: Text(
                  'Data Ibu:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: ibuController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Nama Ibu',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Text(
                  'Tempat Tanggal Lahir Ibu:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 5, 0),
                      child: TextFormField(
                        controller: tmpIbuController,
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
                          DateTime? pickeddateIb = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2999));
                          if (pickeddateIb != null) {
                            setState(() {
                              tglIbuController.text =
                                  DateFormat('dd-MM-yyy').format(pickeddateIb);
                            });
                          }
                        },
                        controller: tglIbuController,
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
                  controller: kerjaIbuController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: 'Pekerjaan Ibu',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: alamatIbuController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    labelText: 'Alamat Ibu',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                child: Center(
                    child: Text(
                  'Data Anak:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: anakController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Nama Anak',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Text(
                  'Tempat Tanggal Lahir Anak:',
                  style: TextStyle(fontSize: 15),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 5, 0),
                      child: TextFormField(
                        controller: tmpAnakController,
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
                              tglAnakController.text =
                                  DateFormat('dd-MM-yyy').format(pickeddate);
                            });
                          }
                        },
                        controller: tglAnakController,
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
                  controller: alamatAnakController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    labelText: 'Alamat Anak',
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
                      alertBox(context, "Apakah semua data sudah benar?", "Pastikan semua data benar", Icons.warning, Colors.yellow, () { _kirimSktm(context);}, () { return;});
                      // _kirimSktm(context);
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

  void _kirimSktm(BuildContext context) async {
    UserModelBaru? user =
        Provider.of<UserProvider>(context, listen: false).userBaru;

    String namaBapak = bapakController.text;
    String ttlBapak = tmpBapakController.text;
    String kerjaBapak = kerjaBapController.text;
    String alamatBapak = alamatBapakController.text;

    String namaIbu = ibuController.text;
    String ttlIbu = tmpIbuController.text;
    String kerjaIbu = kerjaIbuController.text;
    String alamatIbu = alamatIbuController.text;

    String namaAnak = anakController.text;
    String ttlAnak = tmpAnakController.text;
    String jkAnak = _selectedGender;
    String alamatAnak = alamatAnakController.text;

    if (namaBapak.isEmpty ||
        ttlBapak.isEmpty ||
        kerjaBapak.isEmpty ||
        alamatBapak.isEmpty ||
        namaIbu.isEmpty ||
        ttlIbu.isEmpty ||
        kerjaIbu.isEmpty ||
        alamatIbu.isEmpty ||
        namaAnak.isEmpty ||
        ttlAnak.isEmpty ||
        alamatAnak.isEmpty) {
      alert(context, "Lengkapi data terlebih dahulu!");
    } else {
      try {
        ApiService apiService = ApiService();
        Map<String, dynamic> response = await apiService.kirimSktm(
          user!.username,
          namaBapak,
          ttlBapak + ", " + tglBapakController.text,
          kerjaBapak,
          alamatBapak,
          namaIbu,
          ttlIbu + ", " + tglIbuController.text,
          kerjaIbu,
          alamatIbu,
          namaAnak,
          ttlAnak + ", " + tglAnakController.text,
          jkAnak,
          alamatAnak,
        );

        print('Response from server: $response'); // Cetak respons ke konsol

        if (response['status'] == 'success') {
          print('sukses mengirim');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FormSktmFoto(),
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
