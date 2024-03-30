import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KfAppBar(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage(Assets.pictures.batikDrawer.path),
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Scaffold(backgroundColor: Colors.transparent, appBar: KfAppBar(elevation: 20)),
        ),
      ),
    );
  }
}
