import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/drawer_menu_controller.dart';

class DrawerMenuView extends GetView<DrawerMenuController> {
  const DrawerMenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DrawerMenuView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DrawerMenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
