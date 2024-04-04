import 'package:flutter/material.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class SupportPage extends StatelessWidget {
  final SupportType type;
  const SupportPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SupportPage is Working'),
      ),
    );
  }
}
