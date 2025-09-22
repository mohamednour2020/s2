import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../bloc/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? user?.uid ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () => context.read<AuthCubit>().signOut(),
            child: const Text('Sign out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: Text('Hello, $email', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
