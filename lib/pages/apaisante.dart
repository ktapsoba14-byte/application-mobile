import 'package:flutter/material.dart';

class Apaisante extends StatefulWidget {
  const Apaisante({super.key});

  @override
  State<Apaisante> createState() => _ApaisanteState();
}

class _ApaisanteState extends State<Apaisante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apaisante'),
      ),
    );
  }
}