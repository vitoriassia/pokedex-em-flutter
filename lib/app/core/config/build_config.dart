enum BuildConfigType { production }

class BuildConfig {
  static late BuildConfig instance;
  final BuildConfigType type;
  final String apiBaseUrl;
  static const _versionApi = '8';

  BuildConfig.baseProduction({
    this.type = BuildConfigType.production,
    this.apiBaseUrl = 'https://query2.finance.yahoo.com/v$_versionApi/',
  }) {
    instance = this;
  }
}
