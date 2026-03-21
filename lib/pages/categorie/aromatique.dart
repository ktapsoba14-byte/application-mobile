import 'dart:ui';
import 'package:application_mobile/pages/aromatiques/citroneille.dart';
import 'package:application_mobile/pages/aromatiques/the.dart';
import 'package:application_mobile/pages/aromatiques/pima.dart';
import 'package:application_mobile/pages/aromatiques/ail.dart';
import 'package:application_mobile/pages/aromatiques/yulin.dart';
import 'package:application_mobile/pages/favoris_manager.dart';
import 'package:flutter/material.dart';
import 'package:application_mobile/pages/aromatiques/lavande.dart';
import 'package:application_mobile/pages/aromatiques/menthe.dart';
import 'package:application_mobile/pages/aromatiques/romarin.dart';

class Aromatique extends StatefulWidget {
  const Aromatique({super.key});

  @override
  State<Aromatique> createState() => _AromatiqueState();
}

class _AromatiqueState extends State<Aromatique> {
  final plantes = [
    {
      "titre": "Lavande",
      "nomscient": "Lavandula angustifolia",
      "description": "Propriétés calmantes et relaxantes.",
      "photo": "assets/images/lavande.jpeg",
      "page": const Lavande(),
    },
    {
      "titre": "Menthe",
      "nomscient": "Mentha piperita",
      "description": "Fraîche avec de nombreuses vertus digestives.",
      "photo": "assets/images/menthe.jpeg",
      "page": const Menthe(),
    },
    {
      "titre": "Romarin",
      "nomscient": "Rosmarinus officinalis",
      "description": "Stimulante aux propriétés antioxydantes.",
      "photo": "assets/images/romarin.jpeg",
      "page": const Romarin(),
    },
    {
      "titre": "Citronnelle",
      "nomscient": "Cymbopogon citratus",
      "description":
          "Grande herbe vivace poussant en touffes denses, aux feuilles rubanées de couleur vert bleuté, dégageant une odeur de citron très fraîche.",
      "photo": "assets/images/citroneille.png",
      "page": const Citroneille(),
    },
    {
      "titre": "Ail",
      "nomscient": "Allium sativum",
      "description":
          "Plante bulbeuse dont l'odeur soufrée est très puissante une fois le bulbe écrasé.",
      "photo": "assets/images/ail.jpeg",
      "page": const Ail(),
    },
    {
      "titre": "Thé de Gambie",
      "nomscient": "Lippia multiflora",
      "description":
          "Arbrisseau sauvage des savanes guinéennes et soudaniennes, aux feuilles rugueuses et très parfumées (odeur camphrée et citronnée).",
      "photo": "assets/images/the.jpeg",
      "page": const The(),
    },
    {
      "titre": "Yulin-gnuuga",
      "nomscient": "Ocimum basilicum",
      "description":
          "Petite plante annuelle aromatique sous-arbrisseau ou arbuste avec des tiges ramifiées quadrangulaires.",
      "photo": "assets/images/yullin.png",
      "page": const Yulin(),
    },
    {
      "titre": "Petit Piment",
      "nomscient": "Capsicum frutescens",
      "description":
          "Petit arbuste produisant de petits fruits rouges dressés, extrêmement piquants.",
      "photo": "assets/images/pima.jpeg",
      "page": const Pima(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1B4D3E), Color(0xFF0F261F)],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    itemCount: plantes.length,
                    itemBuilder: (context, index) {
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 3000 + (index * 100)),
                        tween: Tween(begin: 0.0, end: 1.0),
                        curve: Curves.easeOutQuart,
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 30 * (1 - value)),
                              child: child,
                            ),
                          );
                        },
                        child: _buildPlantCard(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child:
                Image.asset('assets/images/menthe.png', width: 80, height: 80),
          ),
          const SizedBox(height: 15),
          const Text(
            'Aromatiques',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          const SizedBox(height: 5),
          Text(
            'Parfums et saveurs du jardin',
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${plantes.length} herbes aromatiques',
              style: const TextStyle(
                  color: Color(0xFF81C784),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantCard(int index) {
    final plante = plantes[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => plante['page'] as Widget)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          image: AssetImage(plante['photo'] as String),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(plante['titre'] as String,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text(plante['nomscient'] as String,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic)),
                          const SizedBox(height: 8),
                          Text(plante['description'] as String,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            FavorisManager.estDansFavoris(
                                    plante['titre'] as String)
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: FavorisManager.estDansFavoris(
                                    plante['titre'] as String)
                                ? Colors.redAccent
                                : Colors.white60,
                          ),
                          onPressed: () {
                            setState(() {
                              FavorisManager.ajouterOuRetirer(plante);
                            });
                          },
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.white24, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
