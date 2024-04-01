import 'dart:io';
import 'package:elades/ApiService.dart';
import 'package:elades/baru/PeringatanBerhasilPage.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:elades/baru/FormIzin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FormSktmFoto extends StatefulWidget {
  const FormSktmFoto({Key? key}) : super(key: key);

  @override
  State<FormSktmFoto> createState() => _FormSktmFotoState();
}

class _FormSktmFotoState extends State<FormSktmFoto> {
  File? _image1;

  final picker = ImagePicker();

  Future getImage(int containerIndex, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        if (containerIndex == 1) {
          _image1 = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserModelBaru? user = context.read<UserProvider>().userBaru;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
        child: Center(
          child: Column(
            children: [
              InkWell(
                splashColor: Colors.black,
                onTap: () {
                  _showImageSourceDialog(1);
                },
                child: Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Center(
                    child: _image1 == null
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Tambahkan Foto",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Image.file(_image1!),
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      if (_image1 != null) {
                        try {
                          // Ganti 'userId' dengan nilai yang sesuai
                          String userId = user!.username;

                          // Panggil method updateKtp untuk mengunggah dan memperbarui gambar KTP
                          Map<String, dynamic> result =
                              await ApiService().updateKkSktm(userId, _image1!);

                          // Lakukan penanganan hasil jika diperlukan
                          print('Update successful: $result');

                          // Tambahkan navigasi atau tindakan lain setelah berhasil diunggah
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PeringatanBerhasilPage(),
                            ),
                          );
                        } catch (e) {
                          print('Error uploading image: $e');
                          // Tambahkan penanganan kesalahan jika diperlukan
                        }
                      } else {
                        print('No image selected.');
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

  void _showImageSourceDialog(int containerIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Sumber Gambar"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Galeri"),
                  onTap: () {
                    getImage(containerIndex, ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Kamera"),
                  onTap: () {
                    getImage(containerIndex, ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
