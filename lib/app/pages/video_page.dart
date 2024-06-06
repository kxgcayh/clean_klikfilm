import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  final int videoId;
  final int subcategoryId;
  const VideoPage({
    super.key,
    required this.videoId,
    required this.subcategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KfAppBar(),
      body: Center(
        child: Text(
          'VideoPage($videoId, $subcategoryId) is Working',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
