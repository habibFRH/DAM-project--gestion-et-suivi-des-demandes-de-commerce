// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/pages/add_request.dart';
import 'package:my_flutter_project/pages/requests_states.dart';
import './auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  int index = 0;
  final items = [
    const Icon(
      Icons.task_alt_sharp,
      color: Colors.white,
    ),
    const Icon(
      Icons.add,
      color: Colors.white,
    ),
  ];
  final screens = [const RequestsState(), const AddRequest()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 53,
        onTap: (index) => setState(() {
          this.index = index;
        }),
        index: index,
        items: items,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        color: const Color(0xff5E17EB),
      ),
    );
  }
}
