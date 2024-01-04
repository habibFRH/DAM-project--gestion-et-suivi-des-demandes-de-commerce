import 'package:flutter/material.dart';

class RequestsState extends StatefulWidget {
  const RequestsState({super.key});

  @override
  State<RequestsState> createState() => _RequestsStateState();
}

class _RequestsStateState extends State<RequestsState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Request States',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff5E17EB),
      ),
      body: const Center(
        child: Text("Requests State Page"),
      ),
    );
    ;
  }
}
