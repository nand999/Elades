import 'package:elades/DetailProduk.dart';
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
  List<Map<String, dynamic>> status = [];
  
  ApiService apiService = ApiService();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchData();
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

  Future<void> _refresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    UserModelBaru? user = context.watch<UserProvider>().userBaru;
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
                  title: Text('Header'),
                  background: Image.asset(
                    'assets/galaxy.jpg',
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
                                  "Surat Diproses", "00"),
                              VerticalDivider(
                                color: Colors.white,
                                indent: 20,
                                endIndent: 20,
                              ),
                              _buildInfoColumn(
                                  Icons.done, "Surat Selesai", "00"),
                              VerticalDivider(
                                color: Colors.white,
                                indent: 20,
                                endIndent: 20,
                              ),
                              _buildInfoColumn(
                                  Icons.close, "Surat Ditolak", "00"),
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

                      //  Card(
                      //   elevation: 1,
                      //   margin: EdgeInsets.symmetric(
                      //       vertical: 5.0, horizontal: 16.0),
                      //   child: ListTile(
                      //     leading: Image.network(
                      //       apiService.imgUrl +
                      //           product[
                      //               'foto'], // Sesuaikan dengan nama field yang sesuai
                      //       width: 80.0,
                      //       height: 80.0,
                      //       fit: BoxFit.cover,
                      //     ),
                      //     title: Text(product['judul']),
                      //     subtitle: Text(product['tanggal']),
                      //   ),
                      // ),

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
                                ),
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
                fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(203, 164, 102, 1)),
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
