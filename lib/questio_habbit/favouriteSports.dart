import 'package:flutter/material.dart';

class Favouritesports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Do you have a favourite sport?\nIf so, what is it?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
