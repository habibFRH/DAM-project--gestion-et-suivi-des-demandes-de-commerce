// home_page.dart

// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth/auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              // Call the logout method from your AuthService
              await _authService.signOut();
              // Navigate back to the login page
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Center(
        child: FirebaseAuth.instance.currentUser!.emailVerified
            ? const Text(
                'Welcome to the Home Page!',
                style: TextStyle(fontSize: 20),
              )
            : const Text(
                'please verify your mail',
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
