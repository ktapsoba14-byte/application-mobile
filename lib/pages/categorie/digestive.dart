import 'dart:ui';
import 'package:application_mobile/pages/aromatiques/citroneille.dart';
import 'package:application_mobile/pages/digestives/goyavier.dart';
import 'package:application_mobile/pages/digestives/tamarinier.dart';
import 'package:application_mobile/pages/favoris_manager.dart';
import 'package:flutter/material.dart';
import 'package:application_mobile/pages/digestives/menthe.dart';
import 'package:application_mobile/pages/digestives/camomille.dart';
import 'package:application_mobile/pages/digestives/gingembre.dart';

class Digestive extends StatefulWidget {
  const Digestive({super.key});

  @override
  State<Digestive> createState() => _DigestiveState();
}

class _DigestiveState extends State<Digestive> {
  final plantes = [
    {
      "titre": "Camomille",
      "nomscient": "Matricaria chamomilla",
      "description":
          "Plante médicinale traditionnelle aux propriétés apaisantes.",
      "photo": "assets/images/camomille.jpeg",
      "page": const Camomille(),
    },
    {
      "titre": "Menthe",
      "nomscient": "Mentha x piperita",
      "description":
          "Plante herbacée très odorante à tiges carrées, poussant facilement dans les zones humides ou irriguées.",
      "photo": "assets/images/menthe.jpeg",
      "page": const Menthe(),
    },
    {
      "titre": "Gingembre",
      "nomscient": "Zingiber officinale",
      "description":
          "Plante vivace dont seule la partie souterraine charnue est utilisée en phytothérapie.",
      "photo": "assets/images/gingimbre.jpeg",
      "page": const Gingembre(),
    },
    {
      "titre": "Citroneli",
      "nomscient": "Cymbopogon citratus",
      "description":
          "Herbe vivace, corpulante, aromatique atteignant de 2 m de haut ou plus.",
      "photo": "assets/images/citroneille.png",
      "page": const Citroneille(),
    },
    {
      "titre": "Tamarinier",
      "nomscient": "Tamarindus indica",
      "description":
          "Grand arbre majestueux produisant des gousses brunes contenant une pulpe acide et des graines.",
      "photo": "assets/images/tamarin.jpeg",
      "page": const Tamarinier(),
    },
    {
      "titre": "Goyavier",
      "nomscient": "Psidium guajava",
      "description":
          "Petit arbre fruitier dont l'écorce se desquame par plaques et dont les feuilles sont opposées et nervurées.",
      "photo": "assets/images/govavier.jpeg",
      "page": const Goyavier(),
    }
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
                colors: [Color(0xFF388E3C), Color(0xFF1B5E20)],
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
                        duration: Duration(milliseconds: 300 + (index * 150)),
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
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child:
                Image.asset('assets/images/feuille.png', width: 80, height: 80),
          ),
          const SizedBox(height: 15),
          const Text(
            'Digestives',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          const SizedBox(height: 5),
          Text(
            'Légèreté et bien-être intérieur',
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${plantes.length} plantes essentielles',
              style: const TextStyle(
                  color: Color(0xFFAED581),
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
              color: Colors.white.withOpacity(0.1),
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
