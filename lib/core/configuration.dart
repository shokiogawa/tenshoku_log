class Configuration {
  static const String flavorString = String.fromEnvironment('flavor');
  static const String assetHostUrl = String.fromEnvironment('restApiKey');
}

enum Flavor {
  develop,
  production;

  static Flavor getFromString(String flavorString) => switch (flavorString) {
        'develop' => Flavor.develop,
        'production' => Flavor.production,
        _ => throw Exception('Unknown flavor string: $flavorString'),
      };
}
