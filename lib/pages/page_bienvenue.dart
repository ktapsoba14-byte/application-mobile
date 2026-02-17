import 'package:flutter/material.dart';

class Bienvenue extends StatelessWidget {
  const Bienvenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/images/plante.jpeg"),
               fit: BoxFit.cover,
             )
            ),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}