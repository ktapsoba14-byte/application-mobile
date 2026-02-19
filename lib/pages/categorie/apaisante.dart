import 'package:flutter/material.dart';

class Apaisante extends StatefulWidget {
  const Apaisante({super.key});

  @override
  State<Apaisante> createState() => _ApaisanteState();
}

class _ApaisanteState extends State<Apaisante> {
  final plantes = [
    {
      "titre": "Lavande",
      "nomscient": "Lavandula angustifolia",
      "description": "Propriétés calmantes et relaxantes.",
      "photo": "assets/images/plante.jpeg"
    },
    {
      "titre": "Camomille",
      "nomscient": "Matricaria chamomilla",
      "description": "Plante médicinale traditionnelle aux propriétés apaisantes.",
      "photo": "assets/images/camomille.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Retour aux catégories',
          style: TextStyle(
            color: Colors.green,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green.shade50,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/sakura.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.eco, size: 80, color: Colors.green),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Plantes Apaisantes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  const Text(
                    'Plantes relexantes qui calment le stress et favorise le sommeil.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.eco, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        '${plantes.length} plantes disponibles',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: plantes.length,
                itemBuilder: (context, index) {
                  final plante = plantes[index];
                  final titre = plante['titre'];
                  final nomscient = plante['nomscient'];
                  final description = plante['description'];
                  final photo = plante['photo'];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          '$photo',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        '$titre',
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$nomscient',
                            style: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$description',
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.green),
                      onTap: () {},
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
