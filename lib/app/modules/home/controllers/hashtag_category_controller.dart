import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class HashtagCategoryController extends GetxController with StateMixin<List<VideoContentModel>> {
  @override
  void onInit() async {
    final local = Get.find<LocalUserController>();
    final videoRepository = Get.find<VideoCatalogRepository>();
    final response = await videoRepository.continueWatching(uid: local.authentication.value.userId);
    if (response.data.isNotEmpty) {
      change(response.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
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
}
