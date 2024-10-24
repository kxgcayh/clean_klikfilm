import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenuController extends GetxController {
  final supportExpanded = false.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleSupport() {
    supportExpanded.value = !supportExpanded.value;
  }
}
