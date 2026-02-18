import 'package:flutter/material.dart';

class Digestive extends StatefulWidget {
  const Digestive({super.key});

  @override
  State<Digestive> createState() => _DigestiveState();
}

class _DigestiveState extends State<Digestive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digestive'),
      ),
    );
  }
}