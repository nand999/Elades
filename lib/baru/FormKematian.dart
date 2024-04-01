import 'package:elades/baru/FormIzin.dart';
import 'package:elades/baru/FormIzinFoto.dart';
import 'package:elades/baru/FormKematianFoto.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormKematian extends StatefulWidget {
  const FormKematian({super.key});

  @override
  State<FormKematian> createState() => _FormKematianState();
}

class _FormKematianState extends State<FormKematian> {
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
                  'Data Yang Bersangkutan:',
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
                    labelText: 'Tanggal Kematian',
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
                      if (namaController.text.isEmpty ||
                          alamatController.text.isEmpty ||
                          tglIzinController.text.isEmpty) {
                        alert(context, "Lengkapi semua data terlebih dahulu");
                      } else {
                        _kirimMati(context);
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

  void _kirimMati(BuildContext context) async {
    UserModelBaru? user =
        Provider.of<UserProvider>(context, listen: false).userBaru;

    String NIK = nikController.text;
    String Nama = namaController.text;
    String jk = genderController.text;
    String alamat = alamatController.text;
    String tanggal = tglIzinController.text;

    // Validasi form, misalnya memastikan semua field terisi dengan benar

    try {
      Map<String, dynamic> response = await apiService.kirimSuratMati(
          user!.username, Nama, _selectedGender, alamat, tanggal);

      print('Response from server: $response'); // Cetak respons ke konsol

      if (response['status'] == 'success') {
        print('sukses mengirim');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormKematianFoto(),
          ),
        );
        // Tambahkan logika navigasi atau tindakan setelah login berhasil

        // Set the user data using the provider

      } else if (response['status'] == 'errorValid') {
      } else {
        print('Login failed: ${response['message']}');
      }
    } catch (e) {
      print('Error during login: $e');
      // Tambahkan logika penanganan jika terjadi error
    }
  }

  void alert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: contentBox(context, message),
        );
      },
    );
  }

  Widget contentBox(BuildContext context, String message) {
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
                'Gagal Mengajukan Surat!',
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
            backgroundColor: Colors.redAccent,
            radius: 30,
            child: Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
