import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KfAppBar(),
      body: Center(
        child: Text(
          'SearchPage is Working',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
