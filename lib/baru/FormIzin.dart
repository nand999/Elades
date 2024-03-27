import 'package:elades/baru/FormIzinFoto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormIzin extends StatefulWidget {
  const FormIzin({super.key});

  @override
  State<FormIzin> createState() => _FormIzinState();
}

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

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextFormField(
                  controller: ttlController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.cake),
                    labelText: 'Tempat Tanggal Lahir',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormIzinFoto(),
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
