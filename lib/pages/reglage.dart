import 'package:flutter/material.dart';

class PageReglages extends StatelessWidget {
  const PageReglages({super.key});

  @override
  Widget build(BuildContext context) {
    const colorArrierePlan = Color(0xFFF1F4F1);
    const colorCarteEtFondsDialogues = Color(0xFFFCFDFB);
    const colorTexteTitreSombre = Color(0xFF2E4D32);
    const colorTexteSecondaire = Color(0xFF5C6B5E);
    const colorIconeEtDetails = Color(0xFF81C784);

    return Scaffold(
      backgroundColor: colorArrierePlan,
      appBar: AppBar(
        title: const Text(
          "Paramètres",
          style: TextStyle(
            color: colorTexteTitreSombre,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSectionCarte(
                colorFonds: colorCarteEtFondsDialogues,
                items: [
                  _buildHeaderSection("Apparence", Icons.auto_awesome_mosaic_rounded, colorIconeEtDetails),
                  _buildItem(
                    "Style d'affichage",
                    "Grille ou liste de plantes",
                    onTap: () {},
                  ),
                  const Divider(height: 1, thickness: 0.5, color: Colors.black12, indent: 16, endIndent: 16),
                  _buildItem(
                    "Thème visuel",
                    "Mode vert nature",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildHeaderSection("Mon Herbier", Icons.psychology_alt_rounded, colorIconeEtDetails),
                  _buildItem(
                    "Gérer mes collections",
                    "Organiser vos plantes favorites",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildHeaderSection("Informations", Icons.info_outline_rounded, colorIconeEtDetails),
                  _buildItem(
                    "À propos de l'Herbier",
                    "Notre mission et nos sources",
                    onTap: () => _showAProposDialog(context, colorCarteEtFondsDialogues, colorTexteTitreSombre, colorTexteSecondaire, colorIconeEtDetails),
                  ),
                  const Divider(height: 1, thickness: 0.5, color: Colors.black12, indent: 16, endIndent: 16),
                  _buildItem(
                    "Guide d'utilisation",
                    "Comment identifier une plante ?",
                    onTap: () => _showAideSupportDialog(context, colorCarteEtFondsDialogues, colorTexteTitreSombre, colorTexteSecondaire, colorIconeEtDetails),
                  ),
                  const Divider(height: 1, thickness: 0.5, color: Colors.black12, indent: 16, endIndent: 16),
                  _buildItem(
                    "Langue du catalogue",
                    "Français (Noms latins inclus)",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCarte({required Color colorFonds, required List<Widget> items}) {
    return Container(
      decoration: BoxDecoration(
        color: colorFonds,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }

  Widget _buildHeaderSection(String titre, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 12),
          Text(
            titre,
            style: TextStyle(
              color: iconColor.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Color(0xFF2E4D32), fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Color(0xFF5C6B5E), fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.black26, size: 20),
          ],
        ),
      ),
    );
  }

  void _showAideSupportDialog(BuildContext context, Color colorFonds, Color colorTitre, Color colorSecondaire, Color colorDetail) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: colorFonds,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Guide d'utilisation", style: TextStyle(color: colorTitre, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text("Comment explorer le catalogue :", style: TextStyle(color: colorTitre, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _bullet("Recherchez par nom commun ou nom latin", colorSecondaire),
              _bullet("Filtrez les plantes par vertus (ex: digestion)", colorSecondaire),
              _bullet("Enregistrez vos plantes pour un accès hors-ligne", colorSecondaire),
              _bullet("Consultez les précautions d'usage", colorSecondaire),
              const SizedBox(height: 16),
              Text("Une suggestion botanique ?", style: TextStyle(color: colorTitre, fontWeight: FontWeight.bold)),
              Text("Contactez nos experts : contact@herbier.com", style: TextStyle(color: colorDetail, fontSize: 13)),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Fermer", style: TextStyle(color: colorTitre, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAProposDialog(BuildContext context, Color colorFonds, Color colorTitre, Color colorSecondaire, Color colorDetail) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: colorFonds,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("À propos", style: TextStyle(color: colorTitre, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text("L'Herbier Numérique", style: TextStyle(color: colorTitre, fontWeight: FontWeight.bold, fontSize: 16)),
              Text("Version 1.0.0", style: TextStyle(color: colorDetail, fontSize: 13)),
              const SizedBox(height: 16),
              Text("Cette application répertorie les plantes médicinales et leurs bienfaits traditionnels documentés.", style: TextStyle(color: colorSecondaire, height: 1.4)),
              const SizedBox(height: 12),
              Text("🌿 Cultivé avec passion pour la préservation du savoir botanique.", style: TextStyle(color: colorSecondaire, fontStyle: FontStyle.italic, fontSize: 13)),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Fermer", style: TextStyle(color: colorTitre, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bullet(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("🌱 ", style: TextStyle(fontSize: 12, color: color)),
          Expanded(child: Text(text, style: TextStyle(color: color, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}