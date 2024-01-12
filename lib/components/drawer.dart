// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import 'customLogoAuth.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 181, 151, 241),
        child: ListView(children: [
          const CustomLogoAuth(
            height: 200,
            width: 250,
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/help_page');
              },
              leading: const Icon(
                Icons.help_center,
                color: Colors.black,
              ),
              title: const Text(
                "Help me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/contactus_page');
              },
              leading: const Icon(
                Icons.contact_page,
                color: Colors.black,
              ),
              title: const Text(
                "Contact us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // Card(
          //   child: ListTile(
          //     onTap: () {},
          //     leading: const Icon(
          //       Icons.smart_toy_rounded,
          //       color: Colors.black,
          //     ),
          //     title: const Text(
          //       "Ask GPT",
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          //     ),
          //   ),
          // ),
          Card(
            color: Colors.red,
            child: ListTile(
              onTap: () async {
                await _authService.signOut();
                Navigator.pushNamed(context, '/');
              },
              leading: Icon(
                Icons.login_outlined,
                color: Colors.red[100],
              ),
              title: Text(
                "LOGOUT",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.red[100]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
