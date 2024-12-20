import 'package:expenzo/core/network/app_networks.dart';

class AppEndPoints {
  static const days = 'days';
  static const weeks = 'weeks';
  static const months = 'months';
  static const years = 'years';
  static const settings = 'settings';
  static const expenses = 'expenses';

  static generateUri({
    required String path,
    String? extra,
  }) {
    var uri = '${AppNetworks.supabaseUrl}/$path';
    if (extra != null) {
      uri += '?$extra';
    }

    return Uri.parse(uri);
  }
}
