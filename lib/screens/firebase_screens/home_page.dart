import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s2/services/cubits/auth_cubit.dart';
import 'package:s2/services/firebase_services/firestore_service/firestore_service.dart';


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
            onPressed: () => FireStoreService().getCollection(),
                // context.read<AuthCubit>().signOut()

            child: const Text('create db', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Center(
        child: Text('Hello, $email', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
