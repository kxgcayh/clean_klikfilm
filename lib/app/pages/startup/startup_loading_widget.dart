import 'package:flutter/material.dart';

class StartupLoadingWidget extends StatelessWidget {
  const StartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('StartupLoadingWidget')),
      ),
    );
  }
}
