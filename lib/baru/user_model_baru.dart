// user_model.dart

class UserModelBaru {
  final String username;
  final String nama;
  final dynamic foto_profil;
  final String email;
  final String created;
  final dynamic kode_otp;
 

  UserModelBaru({
    required this.nama,
    required this.foto_profil,
    required this.username,
    required this.email,
    required this.created,
    required this.kode_otp,
  });
}
