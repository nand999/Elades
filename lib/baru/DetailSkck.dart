import 'package:flutter/material.dart';
import '../ApiService.dart';

class DetailSkck extends StatelessWidget {
  final String idProduk;
  final ApiService apiService = ApiService();

  DetailSkck({Key? key, required this.idProduk}) : super(key: key);

  Future<Map<String, dynamic>> fetchProductDetails() async {
    try {
      return await apiService.getSkckDetail(idProduk);
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
                      // buildDetailCard('Kode Surat', productDetails['kode_surat']),
                      buildDetailCard('Tanggal', productDetails['tanggal']),
                      buildDetailCard('Nama', productDetails['nama']),
                      buildDetailCard('NIK', productDetails['nik']),
                      buildDetailCard('Tempat, Tanggal Lahir',
                          productDetails['tempat_tgl_lahir']),
                      buildDetailCard(
                          'Kebangsaan', productDetails['kebangsaan']),
                      buildDetailCard('Agama', productDetails['agama']),
                      buildDetailCard(
                          'Jenis Kelamin', productDetails['jenis_kelamin']),
                      buildDetailCard('Status Perkawinan',
                          productDetails['status_perkawinan']),
                      buildDetailCard('Pekerjaan', productDetails['pekerjaan']),
                      buildDetailCard(
                          'Tempat Tinggal', productDetails['tempat_tinggal']),
                      if (productDetails['status'] != null)
                        buildDetailCard(
                            'Alasan Ditolak', productDetails['alasan'])
                      // buildDetailCard('Username', productDetails['username']),
                      // buildDetailCard('No Pengajuan', productDetails['no_pengajuan']),
                    ],
                  ),
                ),
                if (productDetails['alasan'] !=
                    null) // Tambahkan kondisi di sini
                  Card(
                    elevation: 20,
                    color: Colors.red,
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text( "Alasan Ditolak: "+
                          productDetails['alasan'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
