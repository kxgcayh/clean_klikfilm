import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

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
    klog.f(supportExpanded.value);
  }
}
