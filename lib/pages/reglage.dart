import 'dart:ui';
import 'package:flutter/material.dart';

class PageReglages extends StatelessWidget {
  const PageReglages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F1A),
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF81C784).withOpacity(0.1),
              ),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80)),
            ),
          ),
          SafeArea(
            child: Padding(
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
                  _buildSectionTitle("SUPPORT"),
                  _buildSettingCard([
                    _buildSettingItem(
                        Icons.info_outline_rounded,
                        "À propos de l'herbier",
                        "En savoir plus sur l'application"),
                    const Divider(color: Colors.white10, height: 1, indent: 60),
                    _buildSettingItem(Icons.mail_outline_rounded,
                        "Contacter le support", "Une question ou un bug ?"),
                  ]),
                  const Spacer(),
                  const Center(
                    child: Text(
                      "Version 1.0.2",
                      style: TextStyle(color: Colors.white24, fontSize: 12),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF81C784),
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildSettingCard(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(children: items),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: const Color(0xFF81C784), size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          color: Colors.white24, size: 14),
      onTap: () {},
    );
  }
}
