import 'dart:ui';

import 'package:application_mobile/pages/categorie/apaisante.dart';
import 'package:application_mobile/pages/categorie/aromatique.dart';
import 'package:application_mobile/pages/categorie/cicatrisante.dart';
import 'package:application_mobile/pages/categorie/digestive.dart';
import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  int _selectedIndex = 0;
  final Set<int> _favorisIndices = {};
  final categories = [
    {
      "titre": "Plantes Aromatiques",
      "description":
          "Herbes parfumées aux multiples usages culinaires et thérapeutiques.",
      "icon": "assets/images/menthe.png",
      "page": const Aromatique(),
    },
    {
      "titre": "Plantes Digestives",
      "description":
          "Plantes qui facilitent la digestion et soulagent les troubles gastro-intestinaux.",
      "icon": "assets/images/feuille.png",
      "page": const Digestive(),
    },
    {
      "titre": "Plantes Apaisantes",
      "description":
          "Plantes relaxantes qui calment le stress et favorisent le sommeil.",
      "icon": "assets/images/sakura.png",
      "page": const Apaisante(),
    },
    {
      "titre": "Plantes Cicatrisantes",
      "description":
          "Plantes aux propriétes curatives pour la peau et les blessures.",
      "icon": "assets/images/pousse.png",
      "page": const Cicatrisante(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: const Text(
          'Retour à l\'acceuil',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/images/plante.jpeg",
            fit: BoxFit.cover,
          )),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Catégories",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Explorer les vertus par types de plante",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final titre = cat['titre'];
                  final description = cat['description'];
                  final icon = cat['icon'];
                  final page = cat['page'];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              '$icon',
                              width: 40,
                            ),
                          ),
                          title: Text(
                            '$titre',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            '$description',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 13),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white38,
                            size: 18,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => page as Widget,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Color(0xFF1A1A1A),
        selectedItemColor: Color(0xFF81C784),
        unselectedItemColor: Colors.white38,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Favoris"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: "Paramètre")
        ],
      ),
    );
  }
}
