import 'package:flutter/material.dart';

class Neem extends StatelessWidget {
  const Neem({super.key});

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
          "Catalogue des plantes",
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
                titre: "Indications Reconnues",
                icon: Icons.healing,
                accentColor: Colors.green,
                items: [
                  "Cicatrisation des plaies infectées",
                  "ulcères cutanés",
                  "eczéma et acné",
                  "propriétés antiseptiques puissantes"
                ],
              ),
              _buildInfoCard(
                titre: "Détails Botaniques",
                icon: Icons.biotech,
                accentColor: Colors.blueGrey,
                items: [
                  "Famille : Meliaceae",
                  "Groupes chimiques : Limonoïdes (azadirachtine, nimbin), terpénoïdes et stérols.",
                  "Parties utilisées : Huile de graines (externe), feuilles en décoction (bains ou compresses)."
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
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                'assets/images/neem.jpeg',
                width: double.infinity,
                height: 220,
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
                      Icon(
                        Icons.label_important,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "PLANTES CICATRISANTES",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Neem",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Azadirachta indica",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Colors.blueGrey)),
                  const SizedBox(height: 15),
                  Text(
                    "Arbre robuste à feuilles persistantes, très commun dans les rues de Ouagadougou pour son ombre.",
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
      {required String titre,
      required IconData icon,
      required Color accentColor,
      required List<String> items}) {
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
                Icon(
                  icon,
                  color: accentColor,
                  size: 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  titre,
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
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
                        child: Icon(
                          Icons.circle,
                          color: accentColor,
                          size: 7,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Text(
                        text,
                        style: TextStyle(fontSize: 15),
                      )),
                    ],
                  ),
                ))
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
              "Strictement interdit par voie orale chez les enfants et femmes enceintes (toxicité hépatique et rénale). En usage externe, peut être irritant sur une peau très fine.",
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
