import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class HighlightsCategoryController extends GetxController with StateMixin<VideoHighlightModel> {
  final int categoryId;

  HighlightsCategoryController({required this.categoryId});

  @override
  void onInit() async {
    final videoRepository = Get.find<VideoCatalogRepository>();
    change(null, status: RxStatus.loading());
    final response = await videoRepository.highlightsByCategory(
      cat: categoryId,
    );
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
