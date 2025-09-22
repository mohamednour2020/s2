import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2/screens/firebase_screens/home_page.dart';
import 'package:s2/screens/firebase_screens/signup_screen.dart';
import 'package:s2/services/cubits/auth_cubit.dart';
import 'package:s2/services/cubits/auth_state.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial || state is AuthLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is AuthAuthenticated) {
          return const HomePage();
        }
        final msg = (state is AuthUnauthenticated) ? state.message : null;
        return SignInPage(errorMessage: msg);
      },
    );
  }
}
