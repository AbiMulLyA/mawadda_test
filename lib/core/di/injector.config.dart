// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../auth/bloc/login/login_bloc.dart' as _i4;
import '../../auth/bloc/register/register_bloc.dart' as _i6;
import '../../auth/repository/auth_repository.dart' as _i3;
import '../navigation/bloc/navigation_bloc.dart' as _i9;
import '../util/navigation_util.dart' as _i5;
import '../util/shared_preferences_util.dart' as _i8;
import 'injector.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AuthRepository>(() => _i3.AuthRepository());
    gh.factory<_i4.LoginBloc>(() => _i4.LoginBloc(gh<_i3.AuthRepository>()));
    gh.lazySingleton<_i5.NavigationUtil>(() => _i5.NavigationUtil());
    gh.factory<_i6.RegisterBloc>(() => _i6.RegisterBloc());
    await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.SharedPreferencesUtil>(
        () => _i8.SharedPreferencesUtil());
    gh.factory<_i9.NavigationBloc>(
        () => _i9.NavigationBloc(gh<_i5.NavigationUtil>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
