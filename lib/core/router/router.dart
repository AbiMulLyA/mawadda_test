import 'package:auto_route/auto_route.dart';

import '../../auth/pages/auth_page.dart';
import '../../auth/pages/login_page.dart';
import '../../main.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: MainRoute.page,
    ),
    AutoRoute(
      path: '/auth',
      page: AuthRoute.page,
    ),
    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
    ),
  ];
}
