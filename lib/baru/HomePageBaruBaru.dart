import 'package:elades/baru/DetailBerita.dart';
import 'package:elades/baru/ProfilPageBaruBaru.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elades/user_model.dart';
import 'package:elades/user_provider.dart';
import 'package:elades/ApiService.dart';

class HomePageBaruBaru extends StatefulWidget {
  @override
  _HomePageBaruBaruState createState() => _HomePageBaruBaruState();
}

class _HomePageBaruBaruState extends State<HomePageBaruBaru> {
  List<Map<String, dynamic>> products = [];
  List<String> status = [];

  ApiService apiService = ApiService();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchDataAndStatus();
  }

  Future<void> fetchDataAndStatus() async {
    await Future.wait([fetchStatus(), fetchData()]);
  }

  Future<void> fetchData() async {
    try {
      ApiService apiService = ApiService();
      List<Map<String, dynamic>> productList = await apiService.getBerita();

      setState(() {
        products = productList;
      });
    } catch (e) {
      // Handle error
      print('Failed to load data: $e');
    }
  }

  //   Future<void> fetchStatus(String username) async {
  //   try {
  //     List <String> statusList = await apiService.getStatus(username);
  //     setState(() {
  //       status = statusList;
  //     });
  //   } catch (e) {
  //     // Handle error
  //     print('Failed to load status: $e');
  //   }
  // }

  Future<void> fetchStatus() async {
    UserModelBaru? user = context.read<UserProvider>().userBaru;
    if (user != null) {
      try {
        Map<String, dynamic> statusData =
            await apiService.getStatusBaru(user.username);
        setState(() {
          status = [
            'Surat Masuk: ${statusData['masuk_count']}',
            'Surat Tolak: ${statusData['tolak_count']}',
            'Surat Selesai: ${statusData['selesai_count']}',
          ];
          ;
        });
        print(status);
      } catch (e) {
        // Handle error
        print('Failed to load status: $e');
      }
    }
  }

  Future<void> _refresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    UserModelBaru? user = context.watch<UserProvider>().userBaru;
    // fetchStatus(user!.username);
    return Scaffold(
        body: RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(''),
                  background: Image.asset(
                    'assets/banner.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    color: Color.fromRGBO(203, 164, 102, 1),
                    height: 10.0,
                  ),
                  preferredSize: Size.fromHeight(10.0),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverHeaderDelegate(
                  minHeight: 100,
                  maxHeight: 120,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                          left: 10,
                        ),
                        child: Card(
                          color: Color(0xff2e3654),
                          elevation: 8.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildInfoColumn(Icons.hourglass_bottom_rounded,
                                  "Surat Masuk", getStatusValue('Masuk')),
                              VerticalDivider(
                                color: Colors.white,
                                indent: 20,
                                endIndent: 20,
                              ),
                              _buildInfoColumn(Icons.done, "Surat Selesai",
                                  getStatusValue('Selesai')),
                              VerticalDivider(
                                color: Colors.white,
                                indent: 20,
                                endIndent: 20,
                              ),
                              _buildInfoColumn(Icons.close, "Surat Ditolak",
                                  getStatusValue('Tolak')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Map<String, dynamic> product = products[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBerita(
                              idProduk: int.parse(product['id_berita']),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.all(8),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                      apiService.imgUrl + product['foto'],
                                      width: double.infinity,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        print('Error loading image: $error');
                                        return Image.asset(
                                          'assets/noImage.jpg',
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.contain,
                                        );
                                      },
                                    ) ??
                                    Image.asset("assets/noImage.jpg",
                                        width: double.infinity,
                                        height: 150.0,
                                        fit: BoxFit.cover),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                product['judul'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                product['tanggal'],
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                product['isi'],
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Menambahkan titik-titik jika teks terlalu panjang
                                maxLines:
                                    3, // Batasan jumlah baris teks sebelum ditampilkan titik-titik
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  String getStatusValue(String statusName) {
    // Mencari data status dengan nama yang sesuai
    final statusData = status.firstWhere(
        (element) => element.contains(statusName),
        orElse: () => ""); // Mengembalikan string kosong jika tidak ditemukan
    if (statusData.isNotEmpty) {
      // Memisahkan string untuk mendapatkan jumlah
      final parts = statusData.split(':');
      if (parts.length > 1) {
        return parts[1]
            .replaceAll(RegExp(r'[^\d]'), '')
            .trim(); // Mengembalikan jumlah yang sudah dipisahkan
      }
    }
    return '0'; // Mengembalikan 0 jika tidak ada atau format tidak sesuai
  }
}

Widget _buildInfoColumn(IconData icon, String title, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(203, 164, 102, 1)),
          ),
        ],
      ),

      SizedBox(height: 3),
      Text(
        title,
        style: TextStyle(fontSize: 12, color: Color.fromRGBO(203, 164, 102, 1)),
      ),
      SizedBox(height: 4), // Added SizedBox for spacing
    ],
  );
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
