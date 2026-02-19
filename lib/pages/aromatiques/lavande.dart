import 'package:flutter/material.dart';

class Lavande extends StatelessWidget {
  const Lavande({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Retour aux Plantes Aromatique',
          style: TextStyle(
            color: Colors.green,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
