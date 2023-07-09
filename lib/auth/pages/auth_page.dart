import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawadda_app/auth/pages/login_page.dart';
import 'package:mawadda_app/auth/pages/register_page.dart';
import 'package:mawadda_app/core/navigation/bloc/navigation_bloc.dart';
import 'package:mawadda_app/core/router/router.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const LoginPage(),
                //   ),
                // );
                // context.router.push(const LoginRoute());
                context.router.replace(const LoginRoute());
                context.read<NavigationBloc>().add(const HomeEv());
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
