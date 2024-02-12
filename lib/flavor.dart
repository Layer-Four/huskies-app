/* Available commands:
 flutter run --flavor dev -t lib/main.dart
 flutter run --flavor prod -t lib/main_prod.dart
 flutter run --flavor stage -t lib/main_staging.dart
*/

import 'dart:io';

enum Flavor { development, production, staging }

class Config {
  static Flavor? appFlavor;

  static String get apiUrl => switch (appFlavor) {
        Flavor.development => 'Api link zu dev flavor einfügen',
        Flavor.production => 'Api link zu prod flavor einfügen',
        _ => 'Api link zu staging flavor einfügen'
      };

  static String get plattform => Platform.isAndroid ? 'ANDROID' : 'IOS';
}
