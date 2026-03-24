import 'dart:ui';
import 'package:application_mobile/pages/cicatrisantes/neem.dart';
import 'package:application_mobile/pages/cicatrisantes/anogeussus.dart';
import 'package:application_mobile/pages/cicatrisantes/beurre.dart';
import 'package:application_mobile/pages/cicatrisantes/jatropha.dart';
import 'package:application_mobile/pages/favoris_manager.dart';
import 'package:flutter/material.dart';
import 'package:application_mobile/pages/cicatrisantes/aloe.dart';
import 'package:application_mobile/pages/cicatrisantes/henne.dart';

class Cicatrisante extends StatefulWidget {
  const Cicatrisante({super.key});

  @override
  State<Cicatrisante> createState() => _CicatrisanteState();
}

class _CicatrisanteState extends State<Cicatrisante> {
  final plantes = [
    {
      "titre": "Aloe Vera",
      "nomscient": "Aloe barbadensis miller",
      "description":
          "Plante succulente aux feuilles charnues, bordées de petites dents, contenant un gel translucide.",
      "photo": "assets/images/aloe.jpeg",
      "page": const Aloe(),
    },
    {
      "titre": "Henné",
      "nomscient": "Lawsonia inermis",
      "description":
          "Arbuste dont les feuilles produisent un colorant rouge-orangé, très commun dans le Sahel.",
      "photo": "assets/images/henne.jpeg",
      "page": const Henne(),
    },
    {
      "titre": "Beurre de Karité",
      "nomscient": "Vitellaria paradoxa",
      "description":
          "Arbre emblématique des savanes soudanaises, produisant des noix dont on extrait une matière grasse solide à température ambiante.",
      "photo": "assets/images/beurre.jpeg",
      "page": const Beurre(),
    },
    {
      "titre": "Jatropha",
      "nomscient": "atropha curcas",
      "description":
          "Arbuste souvent utilisé pour faire des haies vives au Burkina, produisant un latex blanc collant.",
      "photo": "assets/images/jatropha.jpeg",
      "page": const Jatropha(),
    },
    {
      "titre": "Anogeissus",
      "nomscient": "Anogeissus leiocarpus",
      "description":
          "Arbre de savane à l'écorce grisâtre, très utilisé dans la pharmacopée traditionnelle burkinabè.",
      "photo": "assets/images/ano.jpeg",
      "page": const Anogeussus(),
    },
    {
      "titre": "Neem",
      "nomscient": "Azadirachta indica",
      "description":
          "Arbre robuste à feuilles persistantes, très commun dans les rues de Ouagadougou pour son ombre.",
      "photo": "assets/images/neem.jpeg",
      "page": const Neem(),
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
                colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
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
                        duration: Duration(milliseconds: 3000 + (index * 150)),
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
                Image.asset('assets/images/pousse.png', width: 80, height: 80),
          ),
          const SizedBox(height: 15),
          const Text(
            'Cicatrisantes',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          const SizedBox(height: 5),
          Text(
            'Réparez votre peau naturellement',
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
              '${plantes.length} plantes disponibles',
              style: const TextStyle(
                  color: Color(0xFFC8E6C9),
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
