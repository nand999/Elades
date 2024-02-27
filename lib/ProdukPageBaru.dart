// Di bagian atas file, import ApiService.dart
import 'package:elades/DetailProduk.dart';
import 'package:flutter/material.dart';

import 'ApiService.dart';

class ProdukPageBaru extends StatefulWidget {
  ProdukPageBaru({Key? key}) : super(key: key);

  @override
  _ProdukPageBaruState createState() => _ProdukPageBaruState();
}

class _ProdukPageBaruState extends State<ProdukPageBaru> {
  late ApiService apiService;
  late Future<List<Map<String, dynamic>>> products;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // apiService = ApiService(
    //     "http://192.168.1.16:8080/coba/mobile"); // Ganti dengan URL backend Anda
    apiService = ApiService();
    products = apiService.getProducts();
  }

    Future<void> searchProducts() async {
    setState(() {
      products = apiService.searchProducts(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Tampilkan daftar produk di sini
            List<Map<String, dynamic>> productList =
                snapshot.data as List<Map<String, dynamic>>;

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  backgroundColor: Color.fromRGBO(203,164,102, 80),
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onSubmitted: (value) => searchProducts(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cari produk...',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 8.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        // Gunakan data produk dari snapshot
                        Map<String, dynamic> product = productList[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 146, 183, 248),
                              onTap: () {
                                // Implement action when grid item is tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailProduk(
                                        idProduk: int.parse(product['id_produk'])),
                                  ),
                                );
                              },
                              child: Ink(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      apiService.imgUrl +
                                          product[
                                              'foto'], // Ganti dengan nama field yang menyimpan URL foto di data produk
                                      width: 120.0,
                                      height: 120.0,
                                    ),
                                    SizedBox(height: 9.0),
                                    Text(
                                      product[
                                          'nama'], // Ganti dengan nama produk
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      "Rp. ${product['harga']}", // Ganti dengan harga produk
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: productList.length,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
