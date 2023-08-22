import 'package:calculator_app/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator App',
          style: TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
