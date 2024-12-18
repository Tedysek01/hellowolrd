import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 11, 127, 1),
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zaregistruj se',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Vytvor ucet a zacni pouzivat HaulGO!',
                style: TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
