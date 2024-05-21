import 'dart:convert';
import 'dart:io';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ApiService {

  //localhost
  // final String baseUrl = "http://172.16.106.180:8080/B2/public/mobile";
  // final String imgUrl = "http://172.16.106.180:8080/B2/public/mobile/images/";
  // final String fotoProfilUrl =
  //     "http://172.16.106.180:8080/B2/public//mobile/images/profil/";
  // final String fotoKtpUrl =
  //     "http://172.16.106.180:8080/B2/public//mobile/images/foto/ktp/";

  //localhost laravel
  final String baseUrl = "http://172.16.106.180:8080/B2/public/MobileAPI";
  final String imgUrl = "http://172.16.106.180:8080/B2/public/data_foto_berita/";
  // final String fotoProfilUrl =
  //     "http://172.16.106.180:8080/B2/public/foto_profil/";
        final String fotoProfilUrl =
      "http://172.16.106.180:8080/B2/public/foto_profil/";
  final String fotoKtpUrl =
      "http://172.16.106.180:8080/B2/public/foto_kelengkapan/";

  
    final String server = "http://172.16.106.180:8080/B2/public/mobileApi";
    

  Future<Map<String, dynamic>> cekEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cek_email.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Failed to get email details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting email details: $e');
    }
  }

  Future<Map<String, dynamic>> cekUsername(String username) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cek_username.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Failed to get email details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting email details: $e');
    }
  }

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

  Future<Map<String, dynamic>> hapusAkun(String username) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/delete_account.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
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
        throw Exception(
            'Failed to load products. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during product search: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getProductNewest() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/get_products_newest.php'));

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

  Future<Map<String, dynamic>> registerBaru(String username, String password,
      String email, String no_hp, String nama) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': email,
          'no_hp': no_hp,
          'nama': nama
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

  Future<Map<String, dynamic>> loginBaru(
      String username, String password) async {
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

  //   Future<Map<String, dynamic>> loginBaru(
  //     String username, String password) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$server/login'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'username': username,
  //         'password': password,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);
  //       return responseData;
  //     } else {
  //       throw Exception('Login failed. Server error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error during login: $e');
  //   }
  // }

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
        final List<Map<String, dynamic>> mappedData =
            List<Map<String, dynamic>>.from(responseData);
        return mappedData;
      } else {
        throw Exception(
            'Gagal mengambil riwayat pengajuan surat. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error mengambil riwayat pengajuan surat: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getStatus(String username) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_status.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        final List<Map<String, dynamic>> mappedData =
            List<Map<String, dynamic>>.from(responseData);
        return mappedData;
      } else {
        throw Exception(
            'Gagal mengambil riwayat pengajuan. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error mengambil pengajuan: $e');
    }
  }

  Future<Map<String, dynamic>> getStatusBaru(String username) async {
    final response =
        await http.get(Uri.parse('$baseUrl/get_status.php?username=$username'));

    if (response.statusCode == 200) {
      // Jika permintaan berhasil, kembalikan data dalam bentuk Map
      return json.decode(response.body);
    } else {
      // Jika permintaan gagal, lemparkan sebuah exception
      throw Exception('Failed to load status');
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Future<Map<String, dynamic>> updateFotoProfilBaru(
      String userId, File image) async {
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
        throw Exception(
            'Gagal mencari pengajuan. Server error: ${response.statusCode}');
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Future<Map<String, dynamic>> getMatiDetail(String idProduk) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_detail_mati.php'),
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Future<Map<String, dynamic>> getPenghasilanDetail(String idProduk) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_detail_penghasilan.php'),
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Future<Map<String, dynamic>> getKematianDetail(String idProduk) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_detail_mati.php'),
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
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Future<Map<String, dynamic>> kirimSuratIzin(
      String username,
      String NIK,
      String Nama,
      String Jenis_kelamin,
      String Tempat_tanggal_lahir,
      String Kewarganegaraan,
      String Agama,
      String Pekerjaan,
      String Alamat,
      String Tempat_kerja,
      String Bagian,
      String Alasan,
      String Tanggal) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/insert_izin.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'NIK': NIK,
          'Nama': Nama,
          'Jenis_kelamin': Jenis_kelamin,
          'Tempat_tanggal_lahir': Tempat_tanggal_lahir,
          'Kewarganegaraan': Kewarganegaraan,
          'Agama': Agama,
          'Pekerjaan': Pekerjaan,
          'Alamat': Alamat,
          'Tempat_kerja': Tempat_kerja,
          'Bagian': Bagian,
          'Alasan': Alasan,
          'Tanggal': Tanggal
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

  Future<bool> uploadKtp(File image, String fileName) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/upload_ktp_izin.php'),
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

  Future<Map<String, dynamic>> updateKtp(String userId, File image) async {
    try {
      // Ubah ini menjadi 'uploadKtp' agar sesuai dengan nama metode yang benar
      String fileName = Uuid().v4() + ".jpg";
      // Mengunggah gambar ke server
      bool uploadSuccess = await uploadKtp(image, fileName);

      if (uploadSuccess) {
        final response = await http.post(
          Uri.parse('$baseUrl/update_ktp_izin.php'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'username': userId,
            'foto_ktp': fileName,
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

  Future<Map<String, dynamic>> kirimSuratMati(String username, String Nama,
      String Jenis_kelamin, String Alamat, String Tanggal) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/insert_mati.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'nama': Nama,
          'jenis_kelamin': Jenis_kelamin,
          'alamat': Alamat,
          'tanggal_kematian': Tanggal
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

  Future<Map<String, dynamic>> kirimSuratPenghasilan(
      String username,
      String Nama,
      String Jenis_kelamin,
      String Alamat,
      String nik,
      String tempat_lahir,
      String tanggal_lahir,
      String pekerjaan,
      String jumlah_penghasilan,
      String kegunaan_surat) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/insert_penghasilan.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'nama_lengkap': Nama,
          'nik': nik,
          'jenis_kelamin': Jenis_kelamin,
          'tempat_lahir': tempat_lahir,
          'tanggal_lahir': tanggal_lahir,
          'pekerjaan': pekerjaan,
          'alamat': Alamat,
          'jumlah_penghasilan': jumlah_penghasilan,
          'kegunaan_surat': kegunaan_surat
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

  Future<bool> uploadKkSktm(File image, String fileName) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/upload_kk_sktm.php'),
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

  Future<Map<String, dynamic>> updateKkSktm(String userId, File image) async {
    try {
      // Ubah ini menjadi 'uploadKtp' agar sesuai dengan nama metode yang benar
      String fileName = Uuid().v4() + ".jpg";
      // Mengunggah gambar ke server
      bool uploadSuccess = await uploadKkSktm(image, fileName);

      if (uploadSuccess) {
        final response = await http.post(
          Uri.parse('$baseUrl/update_kk_sktm.php'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'username': userId,
            'foto_kk': fileName,
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

  Future<Map<String, dynamic>> kirimSktm(
    String username,
    //bapak
    String NamaBapak,
    String ttlBapak,
    String kerjaBapak,
    String alamatBapak,
    //ibu
    String NamaIbu,
    String ttlIbu,
    String kerjaIbu,
    String alamatIbu,
    //anak
    String NamaAnak,
    String ttlAnak,
    String kelaminAnak,
    String alamatAnak,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/insert_sktm.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'nama_bapak': NamaBapak,
          'tempat_tanggal_lahir_bapak': ttlBapak,
          'pekerjaan_bapak': kerjaBapak,
          'alamat_bapak': alamatBapak,
          'nama_ibu': NamaIbu,
          'tempat_tanggal_lahir_ibu': ttlIbu,
          'pekerjaan_ibu': kerjaIbu,
          'alamat_ibu': alamatIbu,
          'nama_anak': NamaAnak,
          'tempat_tanggal_lahir_anak': ttlAnak,
          'jenis_kelamin_anak': kelaminAnak,
          'alamat_anak': alamatAnak,
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

  Future<Map<String, dynamic>> kirimSkck(
    String username,
    String nama,
    String nik,
    String ttl,
    String kebangsaan,
    String pekerjaan,
    String agama,
    String jk,
    String statusKawin,
    String tempatTinggal,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/insert_skck.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'nama': nama,
          'nik': nik,
          'ttl': ttl,
          'kebangsaan': kebangsaan,
          'agama': agama,
          'pekerjaan': pekerjaan,
          'jk': jk,
          'statusKawin': statusKawin,
          'tempatTinggal': tempatTinggal,
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

  Future<Map<String, dynamic>> updateKtpSkck(String userId, File image) async {
    try {
      // Ubah ini menjadi 'uploadKtp' agar sesuai dengan nama metode yang benar
      String fileName = Uuid().v4() + ".jpg";
      // Mengunggah gambar ke server
      bool uploadSuccess = await uploadKtp(image, fileName);

      if (uploadSuccess) {
        final response = await http.post(
          Uri.parse('$baseUrl/update_ktp_skck.php'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'username': userId,
            'foto_ktp': fileName,
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

  Future<Map<String, dynamic>> updateKtpMati(String userId, File image) async {
    try {
      // Ubah ini menjadi 'uploadKtp' agar sesuai dengan nama metode yang benar
      String fileName = Uuid().v4() + ".jpg";
      // Mengunggah gambar ke server
      bool uploadSuccess = await uploadKtp(image, fileName);

      if (uploadSuccess) {
        final response = await http.post(
          Uri.parse('$baseUrl/update_ktp_mati.php'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'username': userId,
            'foto_ktp': fileName,
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

  Future<Map<String, dynamic>> updateKtpPenghasilan(
      String userId, File image) async {
    try {
      // Ubah ini menjadi 'uploadKtp' agar sesuai dengan nama metode yang benar
      String fileName = Uuid().v4() + ".jpg";
      // Mengunggah gambar ke server
      bool uploadSuccess = await uploadKtp(image, fileName);

      if (uploadSuccess) {
        final response = await http.post(
          Uri.parse('$baseUrl/update_ktp_penghasilan.php'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'username': userId,
            'foto_ktp': fileName,
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

  Future<Map<String, dynamic>> updateProfil(String usernameLama,
      String usernameBaru, String nama, String noHp, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/update_profil.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'usernameBaru': usernameBaru,
          'usernameLama': usernameLama,
          'nama': nama,
          'no_hp': noHp,
          'email': email,
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

  Future<Map<String, dynamic>> updateSandi(String email, String sandi) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/update_sandi.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'sandi': sandi,
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

  Future<Map<String, dynamic>> getUserData(
      BuildContext context, String username) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_user_data.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Set user data to UserProvider after fetching from API
        context.read<UserProvider>().setUserBaru(
              UserModelBaru(
                username: responseData['username'] ?? '',
                nama: responseData['nama'] ?? '',
                foto_profil: responseData['foto_profil'] ?? '',
                email: responseData['email'] ?? '',
                noHp: responseData['no_hp'] ?? '',
                created: responseData['created'] ?? '',
                kode_otp: responseData['kode_otp'] ?? '',
              ),
            );

        return responseData;
      } else {
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Future<Map<String, dynamic>> getUserFotoProfil(
      BuildContext context, String username) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_user_data.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Update only the foto_profil in UserProvider after fetching from API
        context
            .read<UserProvider>()
            .updateUserFotoProfil(responseData['foto_profil'] ?? '');

        return responseData;
      } else {
        throw Exception(
            'Failed to get product details. Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }
}
