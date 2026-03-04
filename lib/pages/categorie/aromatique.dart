import 'dart:ui';
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
  final Set<int> _favorisPlantes = {};

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
          // 1. Fond avec dégradé profond
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1B4D3E),
                  Color(0xFF0F261F)
                ], // Vert aromatique plus sombre
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // 2. Header Stylisé
                _buildHeader(),

                // 3. Liste Animée
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    itemCount: plantes.length,
                    itemBuilder: (context, index) {
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 500 + (index * 100)),
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
    final isFav = _favorisPlantes.contains(index);

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
                    // Miniature Photo
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
                    // Textes
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
                    // Actions
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            isFav
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: isFav ? Colors.redAccent : Colors.white60,
                          ),
                          onPressed: () => setState(() => isFav
                              ? _favorisPlantes.remove(index)
                              : _favorisPlantes.add(index)),
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
