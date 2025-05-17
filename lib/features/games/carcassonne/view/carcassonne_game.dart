import 'package:flutter/material.dart';

class CarcassonneGame extends StatelessWidget {
  final bool isAutomatic;

  const CarcassonneGame({
    this.isAutomatic = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Carcassonne Game - ${isAutomatic ? 'Automatic' : 'Manual'} Mode'),
      ),
    );
  }
}
