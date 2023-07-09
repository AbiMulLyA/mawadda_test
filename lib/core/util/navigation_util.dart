import 'package:injectable/injectable.dart';
import 'package:mawadda_app/core/util/shared_preferences_util.dart';

import '../di/injector.dart';

@lazySingleton
class NavigationUtil {
  final SharedPreferencesUtil _sharedPreferencesUtil =
      getIt<SharedPreferencesUtil>();

  static const String prefNavigationKey = 'NAVIGATION';
  static const String prefOnHomeRoute = 'HOME_ROUTE';
  static const String prefOnAuthRoute = 'AUTH_ROUTE';

  Future<void> setNavigationToAuth() async {
    await _sharedPreferencesUtil.setString(prefNavigationKey, prefOnAuthRoute);
  }

  Future<void> setNavigationToHome() async {
    await _sharedPreferencesUtil.setString(prefNavigationKey, prefOnHomeRoute);
  }

  Future<bool> isOnHomeRoute() async {
    final String? where = _sharedPreferencesUtil.getString(prefNavigationKey);

    return where != null && where != '' && where == prefOnHomeRoute;
  }

  Future<bool> isOnAuthRoute() async {
    final String? where = _sharedPreferencesUtil.getString(prefNavigationKey);

    return where != null && where != '' && where == prefOnAuthRoute;
  }
}
