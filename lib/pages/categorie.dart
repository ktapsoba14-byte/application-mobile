import 'dart:ui';
import 'package:application_mobile/pages/categorie/apaisante.dart';
import 'package:application_mobile/pages/categorie/aromatique.dart';
import 'package:application_mobile/pages/categorie/cicatrisante.dart';
import 'package:application_mobile/pages/categorie/digestive.dart';
import 'package:application_mobile/pages/favoris.dart';
import 'package:application_mobile/pages/page_bienvenue.dart';
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
          "Plantes aux propriétés curatives pour la peau et les blessures.",
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
          'Retour à l\'accueil',
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
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final titre = cat['titre'];
                    final description = cat['description'];
                    final image = cat['icon'];
                    final page = cat['page'];

                    return ClipRRect(
                      // Correction du flou qui déborde
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => page as Widget,
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      '$image',
                                      width: 45,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '$titre',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '$description',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFF81C784),
        unselectedItemColor: Colors.white38,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Favoris"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: "Paramètres")
        ],
      ),
    );
  }
}
