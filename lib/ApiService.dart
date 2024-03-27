import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ApiService {

  // final String baseUrl = "http://172.17.202.137:8080/coba/mobile";
  // final String imgUrl = "http://172.17.202.137:8080/coba/mobile/images/";
  // final String fotoProfilUrl = "http://172.17.202.137:8080/coba/mobile/images/profil/";


  final String baseUrl = "http://172.16.106.221:8080/elades/mobile";
  final String imgUrl = "http://172.16.106.221:8080/elades/mobile/images/";
  final String fotoProfilUrl = "http://172.16.106.221:8080/elades/mobile/images/profil/";
  final String fotoKtpUrl = "http://172.16.106.221:8080/elades/mobile/images/foto/ktp/";

  // ApiService(this.baseUrl);


  Future<Map<String, dynamic>> register(
      String username, String password, String nomor) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'nomor': nomor,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Registration failed. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Login failed. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  // Tambahkan metode untuk mendapatkan daftar produk
  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_products.php'));

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        return responseData;
      } else {
        throw Exception(
            'Failed to get products. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting products: $e');
    }
  }

  // mengambil data produk berdasarkan id

Future<Map<String, dynamic>> getProductDetails(int idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_product_details.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_produk': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}

Future<List<Map<String, dynamic>>> searchProducts(String keyword) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/search_products.php?keyword=$keyword'),
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load products. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error during product search: $e');
  }
}


  Future<List<Map<String, dynamic>>> getProductNewest() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_products_newest.php'));

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        return responseData;
      } else {
        throw Exception(
            'Failed to get products. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting products: $e');
    }
  }

  // Tambahkan metode untuk mengunggah foto profil
Future<bool> uploadFotoProfil(File image, String fileName) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/upload.php'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.path,
        filename: fileName,
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to upload image. Server error: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error uploading image: $e');
    return false;
  }
}

Future<Map<String, dynamic>> updateFotoProfil(int userId, File image) async {
  try {
    String fileName = Uuid().v4() + ".jpg";
    bool uploadSuccess = await uploadFotoProfil(image, fileName);

    if (uploadSuccess) {
      final response = await http.post(
        Uri.parse('$baseUrl/update_foto_profil.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id_user': userId,
          'foto_profil': fileName,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Failed to update foto_profil. Server error: ${response.statusCode}');
      }
    } else {
      throw Exception('Failed to upload foto_profil image.');
    }
  } catch (e) {
    throw Exception('Error updating foto_profil: $e');
  }
}




// updateFotoProfil lama 2
// Future<Map<String, dynamic>> updateFotoProfil(int userId, File image) async {
//   try {
//     String fileName = Uuid().v4() + ".jpg";
//     bool uploadSuccess = await uploadFotoProfil(image, fileName);

//     if (uploadSuccess) {
//       final response = await http.post(
//         Uri.parse('$baseUrl/update_foto_profil.php'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'id_user': userId,
//           'foto_profil': fileName,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         return responseData;
//       } else {
//         throw Exception('Failed to update foto_profil. Server error: ${response.statusCode}');
//       }
//     } else {
//       throw Exception('Failed to upload foto_profil image.');
//     }
//   } catch (e) {
//     throw Exception('Error updating foto_profil: $e');
//   }
// }



  //lama 1


//   Future<Map<String, dynamic>> updateFotoProfil(int userId, String fileName) async {
//   try {
//     final response = await http.post(
//       Uri.parse('$baseUrl/update_foto_profil.php'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'id': userId,
//         'foto_profil': fileName,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       return responseData;
//     } else {
//       throw Exception('Failed to update foto_profil. Server error: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Error updating foto_profil: $e');
//   }
// }


//method baru


  // Future<void> saveGoogleEmail(String email) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/save_google_email.php'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'email': email}),
  //   );

  //   if (response.statusCode == 200) {
  //     print('Email saved to database');
  //   } else {
  //     print('Failed to save email to database. Error: ${response.statusCode}');
  //   }
  // }



  Future<void> saveGoogleEmail(String email) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/save_google_email.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    print('Server Response: ${response.body}');
  } catch (error) {
    print('Error during saveGoogleEmail: $error');
  }
}





  Future<Map<String, dynamic>> registerBaru(
      String username, String password, String nomor, String nama) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'nomor': nomor,
          'nama' : nama
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Registration failed. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }



  Future<Map<String, dynamic>> loginBaru(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Login failed. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }


  // Future<List<Map<String, dynamic>>> getPengajuan(String username) async {
  //   try {
  //     final response = await http.get(Uri.parse('$baseUrl/get_pengajuan.php?username=$username'));

  //     if (response.statusCode == 200) {
  //       final List<Map<String, dynamic>> responseData =
  //           List<Map<String, dynamic>>.from(json.decode(response.body));
  //       return responseData;
  //     } else {
  //       throw Exception(
  //           'Failed to get products. Server error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error getting products: $e');
  //   }
  // }


Future<List<Map<String, dynamic>>> getPengajuan(String username) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_pengajuan.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> mappedData = List<Map<String, dynamic>>.from(responseData);
      return mappedData;
    } else {
      throw Exception('Gagal mengambil riwayat pengajuan. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error mengambil pengajuan: $e');
  }
}



  Future<Map<String, dynamic>> getBeritaDetails(int idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_berita_detail.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_berita': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}


  Future<Map<String, dynamic>> getPengajuanDetails(String idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_pengajuan_detail.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}

  Future<Map<String, dynamic>> getIzinDetails(String idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_izin_detail.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'no': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}

Future<Map<String, dynamic>> updateFotoProfilBaru(String userId, File image) async {
  try {
    String fileName = Uuid().v4() + ".jpg";
    bool uploadSuccess = await uploadFotoProfil(image, fileName);

    if (uploadSuccess) {
      final response = await http.post(
        Uri.parse('$baseUrl/update_foto_profil.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': userId,
          'foto_profil': fileName,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Failed to update foto_profil. Server error: ${response.statusCode}');
      }
    } else {
      throw Exception('Failed to upload foto_profil image.');
    }
  } catch (e) {
    throw Exception('Error updating foto_profil: $e');
  }
}

  Future<List<Map<String, dynamic>>> getBerita() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_berita.php'));

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        return responseData;
      } else {
        throw Exception(
            'Failed to get products. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting products: $e');
    }
  }

  Future<List<Map<String, dynamic>>> searchPengajuan(String keyword) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/search_pengajuan.php?keyword=$keyword'),
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Gagal mencari pengajuan. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error ketika mencari pengajuan: $e');
  }
}


  Future<Map<String, dynamic>> getSkckDetail(String idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_detail_skck.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}

   Future<Map<String, dynamic>> getIzinDetail(String idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_detail_izin.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}

   Future<Map<String, dynamic>> getSktmDetail(String idProduk) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/get_detail_sktm.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': idProduk,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to get product details. Server error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error getting product details: $e');
  }
}

}
