import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormIzinFoto extends StatefulWidget {
  const FormIzinFoto({Key? key}) : super(key: key);

  @override
  State<FormIzinFoto> createState() => _FormIzinFotoState();
}

class _FormIzinFotoState extends State<FormIzinFoto> {
  File? _image1;
  File? _image2;

  final picker = ImagePicker();

  Future getImage(int containerIndex, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        if (containerIndex == 1) {
          _image1 = File(pickedFile.path);
        } else if (containerIndex == 2) {
          _image2 = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              InkWell(
                splashColor: Colors.black,
                onTap: () {
                  _showImageSourceDialog(2);
                },
                child: Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Center(
                    child: _image2 == null
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
                        : Image.file(_image2!),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Do something with the selected images
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
