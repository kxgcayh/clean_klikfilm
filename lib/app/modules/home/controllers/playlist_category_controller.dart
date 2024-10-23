import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class PlaylistCategoryController extends GetxController with StateMixin<VideoHighlightModel> {
  @override
  void onInit() async {
    final local = Get.find<LocalUserController>();
    final videoRepository = Get.find<VideoCatalogRepository>();
    final response = await videoRepository.playlist(uid: local.authentication.value.userId);
    if (response.data != null) {
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
