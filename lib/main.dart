import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injector.dart';
import 'core/navigation/bloc/navigation_bloc.dart';
import 'core/router/router.dart';

Future<void> main() async {
  await mainApp();
}

Future<void> mainApp() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await configureInjector();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<NavigationBloc>()..add(const AppStartedEv()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        debugPrint('Navigation State : $state');

        if (state == const AuthSt()) {
          context.router.replace(const AuthRoute());
        }

        if (state == const HomeSt()) {
          // context.router.replace(const LoginRoute());
        }
        return Container(
          color: Colors.white,
        );
      },
    );
  }
}
