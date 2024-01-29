/* Available commands:
 flutter run --flavor dev -t lib/main.dart
 flutter run --flavor prod -t lib/main_prod.dart
 flutter run --flavor stage -t lib/main_staging.dart
*/

enum Flavor { development, production, staging }

class Config {
  static Flavor? appFlavor;

  // static String get apiUrl{

  // }
}
