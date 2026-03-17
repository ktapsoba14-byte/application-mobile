import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Optionnel : pour rendre les liens cliquables

class PageReglages extends StatelessWidget {
  const PageReglages({super.key});

  // Fonction utilitaire pour lancer des appels/mails (nécessite url_launcher)
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Impossible de lancer $uri';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F1A),
      body: Stack(
        children: [
          // Effet de halo lumineux en arrière-plan
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF81C784).withOpacity(0.15),
              ),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: Container(color: Colors.transparent)),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView( // Pour éviter les débordements sur petits écrans
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Réglages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),

                  _buildTitre("À PROPOS"),
                  _buildCarte([
                    _buildDetail(
                        "Application de catalogue de plantes médicinales développée avec Flutter. Explorez les vertus de la nature."),
                  ]),

                  const SizedBox(height: 30),

                  _buildTitre("SUPPORT & CONTACT"),
                  _buildCarte([
                    _buildItem(
                        Icons.mail_outline_rounded,
                        "Contactez-nous",
                        "Une question ou un bug ?",
                        onTap: () => _launchURL('mailto:ktapsoba14@gmail.com')),
                    const Divider(color: Colors.white10, height: 1, indent: 70),
                    _buildContactRow(Icons.phone_iphone_rounded, "+226 75 33 85 07"),
                    _buildContactRow(Icons.alternate_email_rounded, "ktapsoba14@gmail.com"),
                  ]),

                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGETS DE CONSTRUCTION ---

  Widget _buildTitre(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF81C784),
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildCarte(List<Widget> items) {
    return Container(
      clipBehavior: Clip.antiAlias, // Pour que les effets de clic respectent les bords arrondis
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(children: items),
    );
  }

  Widget _buildItem(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF81C784).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF81C784), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white24, size: 14),
    );
  }

  Widget _buildDetail(String texte) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        texte,
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
            height: 1.5,
            fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String texte) {
    return InkWell(
      onTap: () {}, // Ajouter la logique de clic ici
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF81C784).withOpacity(0.7), size: 20),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                texte,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}