import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';

class Predict extends StatelessWidget {
  const Predict({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        actions: const [
          // button to toggle dark mode
          ThemeToggleButton(),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: const Center(
        child: Text('Predict'),
      ),
    );
  }
}
