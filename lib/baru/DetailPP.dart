import 'package:flutter/material.dart';
import 'package:elades/ApiService.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:provider/provider.dart';

class detailPP extends StatefulWidget {
  const detailPP({Key? key});

  @override
  State<detailPP> createState() => _detailPPState();
}

class _detailPPState extends State<detailPP> {
  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    UserModelBaru? user = context.watch<UserProvider>().userBaru;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(''),
      ),
      body: Center(
        child: Hero(
          tag: "PP",
          child: Container(
            height: 400,
            width: 400,
            child: user != null && user.foto_profil != null
                ? Image.network(
                    apiService.fotoProfilUrl + user.foto_profil,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return Image.asset(
                        'assets/nullPP.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      );
                    },
                  )
                : Image.asset(
                    'assets/nullPP.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
