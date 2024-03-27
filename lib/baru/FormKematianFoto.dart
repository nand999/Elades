import 'package:flutter/material.dart';

class FormKematianFoto extends StatefulWidget {
  const FormKematianFoto({super.key});

  @override
  State<FormKematianFoto> createState() => _FormKematianFotoState();
}

class _FormKematianFotoState extends State<FormKematianFoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(child: Text("tambahkan foto"),),
          )
        ],
      ),
    );
  }
}