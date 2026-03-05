import 'dart:ui';
import 'package:application_mobile/pages/categorie/apaisante.dart';
import 'package:application_mobile/pages/categorie/aromatique.dart';
import 'package:application_mobile/pages/categorie/cicatrisante.dart';
import 'package:application_mobile/pages/categorie/digestive.dart';
import 'package:flutter/material.dart';
// Garde tes imports de pages ici...
import 'package:application_mobile/pages/favoris.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  int _selectedIndex = 0;

  // 1. Définition de tes données de catégories
  final List<Map<String, dynamic>> categories = [
    {
      "titre": "Aromatiques",
      "description": "Herbes parfumées et culinaires.",
      "icon": "assets/images/menthe.png",
      "page": const Aromatique(),
    },
    {
      "titre": "Digestives",
      "description": "Pour le confort intestinal.",
      "icon": "assets/images/feuille.png",
      "page": const Digestive(),
    },
    {
      "titre": "Apaisantes",
      "description": "Calme le stress et le sommeil.",
      "icon": "assets/images/sakura.png",
      "page": const Apaisante(),
    },
    {
      "titre": "Cicatrisantes",
      "description": "Soin de la peau et blessures.",
      "icon": "assets/images/pousse.png",
      "page": const Cicatrisante(),
    },
  ];

  // 2. Logique de switch entre les pages
  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const PageFavoris(); // Ta page favoris
      case 2:
        return const Center(
            child: Text("Paramètres", style: TextStyle(color: Colors.white)));
      default:
        return _buildHomeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // AppBar dynamique : on ne l'affiche que sur l'accueil
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white)),
              title: const Text('Retour à l\'accueil',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontStyle: FontStyle.italic)),
            )
          : null,

      body: _getBody(),

      // Dans ton fichier categorie.dart
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex =
                index; // Cela force TOUTE la page à se mettre à jour
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded), label: "Explorer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Favoris"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: "Réglages")
        ],
      ),
    );
  }

  // 3. Contenu de la grille (Explorer)
  Widget _buildHomeContent() {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset("assets/images/plante.jpeg", fit: BoxFit.cover)),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.5)),
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
                    Text("Catégories",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    Text("Explorer les vertus par types de plante",
                        style: TextStyle(color: Colors.white70, fontSize: 16)),
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
                  itemBuilder: (context, index) =>
                      _buildCategoryCard(categories[index]),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // 4. Widget de la carte individuelle
  Widget _buildCategoryCard(Map<String, dynamic> cat) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => cat['page'] as Widget)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(cat['icon'], width: 45),
                  const SizedBox(height: 12),
                  Text(cat['titre'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(cat['description'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 11)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
