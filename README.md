# Application Mobile - Catalogue de Plantes Médicinales 🌿

Application mobile de catalogue de plantes médicinales développée avec **Flutter**.

## 📱 À propos du projet

Cette application offre une plateforme complète pour découvrir, explorer et apprendre les propriétés des plantes médicinales. Conçue pour les utilisateurs mobiles, elle propose une interface intuitive et performante.

## 🎯 Fonctionnalités principales

- 📖 **Catalogue complet** des plantes médicinales
- 🔍 **Recherche et filtrage** avancés
- 📝 **Descriptions détaillées** avec propriétés et utilisations
- ❤️ **Liste de favoris** pour les plantes préférées
- 📚 **Informations complètes** : usages, bénéfices, précautions

## 🛠️ Stack technique

- **Frontend** : [Dart](https://dart.dev/) (83%) - Framework Flutter
- **Backend natif** : C++ (8.5%), Swift (0.8%), C (0.5%)
- **Build** : CMake (6.8%)
- **Autres** : HTML (0.4%)

## 📋 Prérequis

- **Flutter** : [Installation guide](https://flutter.dev/docs/get-started/install)
- **Dart** : Inclus avec Flutter
- **Android Studio** ou **Xcode** (pour développement natif)
- **Git** : Pour cloner le repository

## 🚀 Installation et utilisation

### Cloner le repository

```bash
git clone https://github.com/ktapsoba14-byte/application-mobile.git
cd application-mobile
```

### Installer les dépendances

```bash
flutter pub get
```

### Lancer l'application

```bash
# Sur un appareil Android
flutter run -d android

# Sur un simulateur iOS
flutter run -d ios

# Sur tous les appareils disponibles
flutter run
```

### Build pour la production

```bash
# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release
```

## 📁 Structure du projet

```
.
├── lib/                    # Code source Dart
├── android/                # Configuration Android
├── ios/                    # Configuration iOS
├── assets/                 # Images, données et ressources
├── test/                   # Tests
├── pubspec.yaml            # Dépendances Flutter
└── README.md              # Ce fichier
```

## 🔧 Configuration

### Variables d'environnement

Si nécessaire, créez un fichier `.env` à la racine du projet :

```env
API_URL=votre_url_api
API_KEY=votre_cle_api
```

### Dépendances principales

Consultez `pubspec.yaml` pour la liste complète des dépendances du projet.

## 📚 Documentation

- [Documentation Flutter](https://flutter.dev/docs)
- [Dart Language Documentation](https://dart.dev/guides)
- [Guide des Plugins Flutter](https://pub.dev)

## 🤝 Contribution

Les contributions sont bienvenues ! Pour contribuer :

1. Fork le repository
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Poussez vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📝 Licence

Ce projet est distribué sous la licence MIT. Consultez le fichier `LICENSE` pour plus de détails.

## 👤 Auteur

- **GitHub** : [@ktapsoba14-byte](https://github.com/ktapsoba14-byte)

## 📮 Support

Pour toute question ou problème, veuillez ouvrir une [issue](https://github.com/ktapsoba14-byte/application-mobile/issues) sur GitHub.

---

**Fait avec ❤️ pour la découverte des plantes médicinales**
