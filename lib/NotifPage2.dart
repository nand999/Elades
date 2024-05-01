import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:elades/baru/user_model_baru.dart';
import 'package:elades/user_provider.dart';

class NotifPage2 extends StatefulWidget {
  @override
  _NotifPage2State createState() => _NotifPage2State();
}

class _NotifPage2State extends State<NotifPage2> {
  List<Map<String, dynamic>> laporan = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    UserModelBaru? user =
        Provider.of<UserProvider>(context, listen: false).userBaru;
    final String username = user!.username;
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.1.19:8080/elades/mobile/get_notifikasi.php?username=$username'));

      if (response.statusCode == 200) {
        setState(() {
          laporan = json.decode(response.body).cast<Map<String, dynamic>>();
        });
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: laporan.length,
        itemBuilder: (context, index) {
          Color statusColor = Colors.blue;
          if (laporan[index]['status'] == 'Tolak') {
            statusColor = Colors.red;
          } else if (laporan[index]['status'] == 'Selesai') {
            statusColor = Colors.green;
          }

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                laporan[index]['tanggal'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    laporan[index]['nama'] ?? "",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 4),
                  Text(
                    laporan[index]['alasan'] ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: Text(
                laporan[index]['status'],
                style: TextStyle(color: statusColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
