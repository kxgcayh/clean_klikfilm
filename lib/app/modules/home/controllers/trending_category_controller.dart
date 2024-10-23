import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class TrendingCategoryController extends GetxController with StateMixin<List<VideoContentModel>> {
  @override
  void onInit() async {
    final videoRepository = Get.find<VideoCatalogRepository>();
    final response = await videoRepository.videoTrending(rdm: true);
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
