import 'package:flutter/material.dart';

class Aloe extends StatelessWidget {
  const Aloe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Retour aux Plantes Cicatrisantes',
          style: TextStyle(
            color: Colors.green,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green.shade50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/aloe.jpeg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.eco, color: Colors.green, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  "PLANTE MÉDICINALE",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Aloe Vera",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Aloe barbadensis miller",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Plante succulente reconnue pour ses vertus hydratantes et cicatrisantes.",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: 450,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Vertus et Bienfaits",
                            style: TextStyle(color: Colors.green, fontSize: 25),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                                "Hydrate et apaise la peau en profondeur",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                                "Accélère la cicatrisation des brûlures et plaies",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text("Soulage les coups de soleil",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Réduit l'inflammation et les rougeurs",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                                "Améliore la digestion lorsqu'elle est consommée en gel",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text("Renforce le système immunitaire",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: 450,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue,
                            size: 30,
                          ),
                          Text(
                            "Mode d'utilisation",
                            style: TextStyle(color: Colors.blue, fontSize: 25),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Application cutanée : appliquer le gel directement sur la peau",
                            style: TextStyle(fontSize: 15),
                          )),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Masque visage : mélanger le gel avec du miel",
                            style: TextStyle(fontSize: 15),
                          )),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Cheveux : appliquer comme masque capillaire",
                            style: TextStyle(fontSize: 15),
                          )),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Boisson : diluer le gel dans de l'eau ou du jus (gel comestible uniquement)",
                            style: TextStyle(fontSize: 15),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: 450,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Text(
                            "Precautions d'Emploi",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                              child: Text(
                            "L'huile essentielle pure peut irriter la peau",
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                              child: Text(
                            "Vérifier l'absence d'allergie avant la première utilisation",
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                              child: Text(
                            "Le latex d'aloe vera peut avoir un effet laxatif",
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                              child: Text(
                            "Déconseillé aux femmes enceintes et allaitantes en usage interne",
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                              child: Text(
                            "Utiliser uniquement le gel, pas la peau de la feuille",
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.orange,
                            width: 2,
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            children: [
                              TextSpan(
                                text: "Important : ",
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    "Ces informations sont fournies à titre éducatif. Consultez toujours un professionnel de santé avant d'utiliser des plantes médicinales, surtout en cas de grossesse, allaitement ou traitement médical en cours.",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
