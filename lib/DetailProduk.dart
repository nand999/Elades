import 'package:flutter/material.dart';
import 'ApiService.dart';  // Don't forget to import ApiService.dart

class DetailProduk extends StatelessWidget {
  final int idProduk;
  // final ApiService apiService = ApiService("http://192.168.1.16:8080/coba/mobile");
  final ApiService apiService = ApiService();

  DetailProduk({Key? key, required this.idProduk}) : super(key: key);

  // TODO: Implement logic to fetch product details based on idProduk
  // You can use this.idProduk to retrieve the ID of the selected product
  // This is just a placeholder and you should replace it with actual data fetching logic

  Future<Map<String, dynamic>> fetchProductDetails() async {
    try {
      return await apiService.getProductDetails(idProduk);
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: Image.network(
                          apiService.imgUrl + productDetails['foto'],
                          width: 300,
                          height: 300,
                        ),
                      ),
                      Card(
                        color: Colors.blueGrey,
                        child: Container(
                          width: 450,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              productDetails['nama'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
                        child: Text(
                          productDetails['deskripsi'],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
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
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              "Rp. ${productDetails['harga']}",
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
                    Positioned(
                      top: -10,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Handle button tap
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlue,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
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
