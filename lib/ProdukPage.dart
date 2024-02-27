// import 'package:coba_tampilan/DetailProduk.dart';
// import 'package:flutter/material.dart';


// class ProdukPage extends StatelessWidget {
//   ProdukPage({super.key});

//   // Dummy data
//   final List<String> produkList = [
//     'Produk 1',
//     'Produk 2',
//     'Produk 3',
//     'Produk 4',
//     'Produk 5',
//     'Produk 6',
//     'Produk 7',
//     'Produk 8',
//     'Produk 9',
//     'Produk 10',
//     'Produk 11',
//     'Produk 12',
//     'Produk 13',
//     'Produk 14',
//     'Produk 15',
//     // Add more dummy data as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             floating: false,
//             backgroundColor: Colors.blue.shade200,
//             title: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(Icons.search),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Cari produk...',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(8.0),
//             sliver: SliverGrid(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 8.0,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: Border.all(color: Colors.grey, width: 1.0),
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         splashColor: const Color.fromARGB(255, 146, 183, 248),
//                         onTap: () {
//                           // Implement action when grid item is tapped
//                           // print('Produk ${index + 1} tapped');
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailProduk(),
//                             ),
//                           );
//                         },
//                         child: Ink(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/galaxy.jpg',
//                                 width: 120.0,
//                                 height: 120.0,
//                               ),
//                               SizedBox(height: 9.0),
//                               Text(
//                                 produkList[index],
//                                 style: TextStyle(fontSize: 18.0),
//                               ),
//                               SizedBox(height: 2.0),
//                               Text(
//                                 "Harga",
//                                 style: TextStyle(fontSize: 15.0),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 childCount: produkList.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
