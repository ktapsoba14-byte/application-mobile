import 'package:flutter/material.dart';

class Anogeussus extends StatelessWidget {
  const Anogeussus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Catalogue des Plantes',
          style: TextStyle(
            color: Colors.green,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.green.shade50,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              _buildHeaderCard(),
              _buildInfoCard(
                title: "Indications Reconnues",
                icon: Icons.healing,
                accentColor: Colors.green,
                items: [
                  "Cicatrisation des plaies chroniques",
                  "infections cutanées",
                  "soins bucco-dentaires (gencives saignantes)",
                ],
              ),
              _buildInfoCard(
                title: "Détails Botaniques",
                icon: Icons.biotech,
                accentColor: Colors.blueGrey,
                items: [
                  "Famille : Combretaceae",
                  "Groupes chimiques : Tanins galliques et ellagiques (astringents), flavonoïdes et triterpènes.",
                  "Parties utilisées : Écorce du tronc ou des racines (en décoction ou poudre).",
                ],
              ),
              _buildWarningCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note : Remplace par ton image réelle ou une icône par défaut
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                'assets/images/ano.jpeg', // Le chemin vers votre image
                width: double.infinity,
                height: 220, // Hauteur ajustée pour un meilleur rendu
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.label_important,
                          color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Text("PLANTE CICATRISANTE",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("Anogeissus",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  const Text("Anogeissus leiocarpus",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Colors.blueGrey)),
                  const SizedBox(height: 15),
                  const Text(
                    "Description : Arbre de savane à l'écorce grisâtre, très utilisé dans la pharmacopée traditionnelle burkinabè.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {
        required String title,
        required IconData icon,
        required Color accentColor,
        required List<String> items
      }
    ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: accentColor, size: 28),
                const SizedBox(width: 10),
                Text(title,
                    style: TextStyle(
                        color: accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 15),
            ...items.map((text) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child:
                              Icon(Icons.circle, color: accentColor, size: 7)),
                      const SizedBox(width: 12),
                      Expanded(
                          child:
                              Text(text, style: const TextStyle(fontSize: 15))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildWarningCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.red.shade200, width: 1.5),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber_rounded,
                    color: Colors.red.shade800, size: 28),
                const SizedBox(width: 10),
                Text("Contre-indications",
                    style: TextStyle(
                        color: Colors.red.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Usage prolongé par voie interne déconseillé en raison de la forte concentration en tanins (peut irriter l'estomac).",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
