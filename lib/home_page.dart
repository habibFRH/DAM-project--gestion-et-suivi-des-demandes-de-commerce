// home_page.dart

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


            // ElevatedButton(
            //   onPressed: () async {
            //     // Call the sign-out method
            //     await _authService.signOut();
            //     // Navigate back to the login page
            //     Navigator.pop(context);
            //   },
            //   child: Text('Sign Out'),
            // ),