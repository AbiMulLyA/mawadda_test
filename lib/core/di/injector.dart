// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mawadda_app/core/di/injector.config.dart';

final getIt = GetIt.instance;

//* Initial authGetIt
@InjectableInit(
  initializerName: 'initGetIt', // default\
  generateForDir: ['lib'],
  preferRelativeImports: true,
)
configureInjector() => getIt.initGetIt();

//* For Thirdparty Plugins
@module
abstract class RegisterModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
