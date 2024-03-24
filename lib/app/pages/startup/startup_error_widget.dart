import 'package:flutter/material.dart';

class AppStartupErrorPage extends StatelessWidget {
  final String? message;
  final void Function()? onRetry;
  const AppStartupErrorPage({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message ?? 'Something Went Wrong'),
            TextButton(onPressed: onRetry, child: Text('Retry'))
          ],
        ),
      ),
    );
  }
}
