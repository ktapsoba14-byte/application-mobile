import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:application_mobile/pages/favoris_manager.dart';

class PageFavoris extends StatefulWidget {
  const PageFavoris({super.key});

  @override
  State<PageFavoris> createState() => _PageFavorisState();
}

class _PageFavorisState extends State<PageFavoris> {
  @override
  Widget build(BuildContext context) {
    final favoris = FavorisManager.listeFavoris;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 1. Fond avec dégradé organique profond
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0D1F1A), Color(0xFF050505)],
              ),
            ),
          ),

          // 2. Décoration lumineuse en arrière-plan (Blur effect)
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF81C784).withOpacity(0.15),
              ),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50)),
            ),
          ),

          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // AppBar stylisée
                _buildSliverAppBar(),

                // Contenu de la liste
                favoris.isEmpty
                    ? SliverFillRemaining(child: _buildEmptyState())
                    : SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                _buildPlantCard(favoris[index], index),
                            childCount: favoris.length,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mon Herbier",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              "${FavorisManager.listeFavoris.length} plantes sauvegardées",
              style:
                  TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.eco_outlined, size: 100, color: Colors.white10),
        const SizedBox(height: 20),
        Text(
          "Votre herbier est vide",
          style: TextStyle(
              color: Colors.white38, fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget _buildPlantCard(Map<String, dynamic> plante, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Row(
              children: [
                // Image avec ombre interne
                Hero(
                  tag: 'plant-${plante['titre']}',
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: AssetImage(plante['photo']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Informations
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plante['titre'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        plante['nomscient'],
                        style: TextStyle(
                          color: const Color(0xFF81C784).withOpacity(0.8),
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Badge "Voir détails"
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Détails",
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                // Bouton supprimer avec effet
                IconButton(
                  icon: const Icon(Icons.favorite,
                      color: Colors.redAccent, size: 28),
                  onPressed: () {
                    setState(() {
                      FavorisManager.ajouterOuRetirer(plante);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
