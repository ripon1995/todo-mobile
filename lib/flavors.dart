enum Flavor {
  DEV,
  STG,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'dev';
      case Flavor.STG:
        return 'stg';
      case Flavor.PROD:
        return 'prod';
      default:
        return 'title';
    }
  }

}
