import 'dart:ui';
import 'package:application_mobile/pages/aromatiques/lavande.dart';
import 'package:application_mobile/pages/digestives/camomille.dart';
import 'package:application_mobile/pages/favoris_manager.dart';
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
      "description": "Propriétés calmantes, relaxantes et cicatrisantes.",
      "photo": "assets/images/plante.jpeg",
      "page": const Lavande(),
    },
    {
      "titre": "Camomille",
      "nomscient": "Matricaria chamomilla",
      "description":
          "Idéale pour apaiser le système nerveux et faciliter le sommeil.",
      "photo": "assets/images/camomille.jpeg",
      "page": const Camomille(),
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
                colors: [Color(0xFF2D5A27), Color(0xFF1E3C1A)],
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
                        duration: Duration(milliseconds: 3000 + (index * 200)),
                        tween: Tween(begin: 0.0, end: 1.0),
                        curve: Curves.easeOutQuart,
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 50 * (1 - value)),
                              child: child,
                            ),
                          );
                        },
                        child: _buildPlantesCartes(index),
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
                Image.asset('assets/images/sakura.png', width: 80, height: 80),
          ),
          const SizedBox(height: 15),
          const Text(
            'Apaisantes',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          const SizedBox(height: 5),
          Text(
            'Calmez votre esprit naturellement',
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantesCartes(int index) {
    final plante = plantes[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => plante['page'] as Widget),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(plante['photo'] as String),
                            fit: BoxFit.cover),
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
                            color: Colors.white30, size: 16),
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
