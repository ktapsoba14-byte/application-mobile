import 'package:application_mobile/pages/categorie.dart';
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
            )),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.eco,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Catalogue de Plantes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Médecinales',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF81C784),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Découvrez les bienfaits de la nature et explorez les vertus thérapeutiques des plantes utilisées depuis des millénaires.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Categorie())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green[800],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Explorer Nos Plantes !',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
