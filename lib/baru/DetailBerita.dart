import 'package:flutter/material.dart';
import 'package:elades/ApiService.dart';

class DetailBerita extends StatelessWidget {
  final int idProduk;
  final ApiService apiService = ApiService();

  DetailBerita({Key? key, required this.idProduk}) : super(key: key);

  Future<Map<String, dynamic>> fetchProductDetails() async {
    try {
      return await apiService.getBeritaDetails(idProduk);
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchProductDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          Map<String, dynamic> productDetails =
              snapshot.data as Map<String, dynamic>;

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          apiService.imgUrl + productDetails['foto'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productDetails['judul'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        productDetails['tanggal'],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productDetails['isi'],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: Container(
            //   color: Color.fromRGBO(203, 164, 102, 1),
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     productDetails['tanggal'],
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          );
        }
      },
    );
  }
}
