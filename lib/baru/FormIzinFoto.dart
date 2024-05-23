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

class FormIzinFoto extends StatefulWidget {
  const FormIzinFoto({Key? key}) : super(key: key);

  @override
  State<FormIzinFoto> createState() => _FormIzinFotoState();
}

class _FormIzinFotoState extends State<FormIzinFoto> {
  File? _image1;
  final picker = ImagePicker();
  ApiService apiService = ApiService();
  String? userId;

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
  void initState() {
    super.initState();
    UserModelBaru? user = context.read<UserProvider>().userBaru;
    userId = user!.username;
  }

  //method _uploadimage dari alvian
  Future<void> _uploadImage() async {
    if (_image1 == null) {
      // Tampilkan pesan bahwa gambar belum dipilih
      return;
    }
    final String apiUrl = apiService.baseUrl + "/uploadKtpIzin.php";
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.fields['userId'] = userId.toString();
    if (_image1 != null) {
      String fileName = _image1!.path.split('/').last;
      var image = await http.MultipartFile.fromPath('image', _image1!.path);
      request.files.add(image);
    }
    var streamedResponse = await request.send();
    if (streamedResponse.statusCode == 200) {
      print('Gambar berhasil diunggah');
    } else {
      print('Gagal mengunggah gambar: ${streamedResponse.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModelBaru? user = context.read<UserProvider>().userBaru;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Unggah foto KTP anda",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff2e3654),
      ),
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

                          // // Panggil method updateKtp untuk mengunggah dan memperbarui gambar KTP
                          // Map<String, dynamic> result =
                          //     await ApiService().updateKtp(userId, _image1!);

                          // // Lakukan penanganan hasil jika diperlukan
                          // print('Update successful: $result');

                          _uploadImage();

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
                        alert(context, "Pilh gambar terlebih dahulu!");
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

    // Future<bool> uploadImage(File image) async {
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(apiService.baseUrl + '/upload_ktp.php'),
//       );

//       request.files.add(
//         await http.MultipartFile.fromPath(
//           'file',
//           image.path,
//           filename:
//               Uuid().v4() + ".jpg", // Generate a random filename using uuid
//         ),
//       );

//       var response = await request.send();

//       if (response.statusCode == 200) {
//         // Gambar berhasil diunggah. Sekarang perbarui foto_profil di tabel pengguna.
//         return true;
//       } else {
//         print('Failed to upload image. Server error: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//       return false;
//     }
//   }

// Future<void> updateKtp(File image) async {
//   UserModelBaru? user = context.read<UserProvider>().userBaru;
//   if (user != null) {
//     try {
//       bool uploadSuccess = await uploadImage(image);

//       if (uploadSuccess) {
//         // Menghasilkan nama file
//         String fileName = Uuid().v4() + ".jpg";

//         // Memperbarui ktp dengan nama file yang dihasilkan
//         await apiService.updateKtp(user.username!, fileName);

//         print('Perbarui foto_ktp berhasil untuk ' + user.username.toString());
//         setState(() {
//           UserModelBaru? updatedUser = context.read<UserProvider>().userBaru;
//           if (updatedUser != null) {
//             context.read<UserProvider>().setUserBaru(updatedUser);
//           }
//         });
//         // Melakukan tindakan tambahan jika diperlukan setelah berhasil memperbarui foto profil
//       } else {
//         print('Gagal memperbarui foto_ktp');
//       }
//     } catch (e) {
//       print('Error updating foto_ktp: $e');
//     }
//   }
// }
