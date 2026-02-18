import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  final categories = [
    {
      "titre": "Plantes Aromatiques",
      "description":
          "Herbes parfumées aux multiples usages culinaires et thérapeutiques.",
      "icon": Icons.eco,
    },
    {
      "titre": "Plantes Digestives",
      "description":
          "Plantes qui facilitent la digestion et soulagent les troubles gastro-intestinaux.",
      "icon": Icons.restaurant,
    },
    {
      "titre": "Plantes Apaisantes",
      "description":
          "Plantes relaxantes qui calment le stress et favorisent le sommeil.",
      "icon": Icons.bedtime,
    },
    {
      "titre": "Plantes Cicatrisantes",
      "description":
          "Plantes aux propriétes curatives pour la peau et les blessures.",
      "icon": Icons.healing,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green.shade700,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Catégories de plantes disponibles",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Choisissez une caégorie pour explorer les plantes correspondantes",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final categorie = categories[index];
              final titre = categorie['titre'];
              final description = categorie['description'];
              final icon = categorie['icon'];
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(icon as IconData, color: Colors.green),
                  title: Text('$titre'),
                  subtitle: Text('$description'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
