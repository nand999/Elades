import 'package:flutter/material.dart';
import '../ApiService.dart';

class DetailPengajuan extends StatelessWidget {
  final String idProduk;
  final ApiService apiService = ApiService();

  DetailPengajuan({Key? key, required this.idProduk}) : super(key: key);

  Future<Map<String, dynamic>> fetchProductDetails() async {
    try {
      return await apiService.getPengajuanDetails(idProduk);
    } catch (e) {
      throw Exception('Error getting product details: $e');
    }
  }

  Widget buildDetailCard(String label, String value) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
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
          // Extract product details from snapshot
          Map<String, dynamic> productDetails =
              snapshot.data as Map<String, dynamic>;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      buildDetailCard('Kode Surat', productDetails['kode_surat']),
                      buildDetailCard('Tanggal', productDetails['tanggal']),
                      buildDetailCard('Nama', productDetails['nama']),
                      buildDetailCard('NIK', productDetails['nik']),
                      buildDetailCard('Username', productDetails['username']),
                      buildDetailCard('No Pengajuan', productDetails['no_pengajuan']),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        elevation: 20,
                        color: Colors.blue,
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              productDetails['nik'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
