import 'package:flutter/material.dart';

class Menthe extends StatelessWidget {
  const Menthe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Retour aux Plantes Aromatiques',
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
                    mainAxisSize:
                        MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/menthe.jpeg',
                          width: double
                              .infinity,
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
                              "Menthe",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Mentha piperita",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Plante aromatique fraîche aux nombreuses vertus digestives.",
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
                                "Facilite la digestion et réduit les ballonnements",
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
                            child: Text("Apaise les maux de tête",
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
                                "Rafraîchit l'haleine",
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
                              "Dégage les voies respiratoires",
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
                                "Effet stimulant et tonifiant",
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
                            "Infusion : quelques feuilles fraîches ou séchées dans de l'eau chaude",
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
                            "Huile essentielle : 1-2 gouttes sur un sucre ou dans une tisane",
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
                            "Inhalation : pour dégager le nez",
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
                            "Cuisine : agrémenter plats et boissons",
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
                            "L'huile essentielle est déconseillée aux enfants de moins de 6 ans",
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
                            "Peut aggraver le reflux gastro-œsophagien",
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
                            "Éviter en cas de calculs biliaires",
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
                            "Déconseillée pendant l'allaitement (réduit la lactation)",
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
