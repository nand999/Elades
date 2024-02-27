// Di bagian atas file, import ApiService.dart
import 'package:elades/baru/DetailIzin.dart';
import 'package:elades/baru/DetailPengajuan.dart';
import 'package:elades/baru/DetailSkck.dart';
import 'package:elades/DetailProduk.dart';
import 'package:elades/baru/DetailSktm.dart';
import 'package:elades/user_model.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ApiService.dart';

class PengajuanPage extends StatefulWidget {
  PengajuanPage({Key? key}) : super(key: key);

  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  late ApiService apiService;
  late Future<List<Map<String, dynamic>>> products;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // apiService = ApiService(
    //     "http://192.168.1.16:8080/coba/mobile"); // Ganti dengan URL backend Anda
    apiService = ApiService();
    UserModelBaru? user = context.read<UserProvider>().userBaru;
    products = apiService.getPengajuan(user!.username);
  }

  Future<void> searchPengajuan() async {
    setState(() {
      products = apiService.searchPengajuan(searchController.text);
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
                  backgroundColor: Color.fromRGBO(203, 164, 102, 80),
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
                            onSubmitted: (value) => searchPengajuan(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cari berdasarkan nama pengaju...',
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
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 8.0,
                      childAspectRatio:
                          2.0, // Menentukan rasio tinggi terhadap lebar item
                      mainAxisExtent: 100.0,
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
                                if (product['kode_surat'] == "skck") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailSkck(
                                          idProduk: product['no_pengajuan']
                                              .toString()),
                                    ),
                                  );
                                } else if (product['kode_surat'] ==
                                    "surat_ijin") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailIzin(
                                          idProduk: product['no_pengajuan']
                                              .toString()),
                                    ),
                                  );
                                } else if (product['kode_surat'] == "sktm") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailSktm(
                                          idProduk: product['no_pengajuan']
                                              .toString()),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPengajuan(
                                          idProduk: product['no_pengajuan']
                                              .toString()),
                                    ),
                                  );
                                }
                              },
                              child: Ink(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        product['kode_surat'],
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                    // SizedBox(height: 2.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        product['nama'],
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                    // Spacer(), // Spacer untuk memberikan ruang di antara nama dan tanggal
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${product['tanggal']}",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        ),
                                      ],
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
