class FavorisManager {
  static List<Map<String, dynamic>> listeFavoris = [];

  static bool estDansFavoris(String titre) {
    return listeFavoris.any((p) => p['titre'] == titre);
  }

  static void ajouterOuRetirer(Map<String, dynamic> plante) {
    final index = listeFavoris.indexWhere((p) => p['titre'] == plante['titre']);
    if (index != -1) {
      listeFavoris.removeAt(index);
    } else {
      listeFavoris.add(plante);
    }
  }
}
