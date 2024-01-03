import 'package:flutter/material.dart';

class RequestsState extends StatefulWidget {
  const RequestsState({super.key});

  @override
  State<RequestsState> createState() => _RequestsStateState();
}

class _RequestsStateState extends State<RequestsState> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Requests State Page"),
      ),
    );;
  }
}