import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class DrawerEventMenuController extends GetxController with StateMixin<List<EventMenuDataModel>> {
  @override
  Future<void> onInit() async {
    final videoRepository = Get.find<VideoCatalogRepository>();
    change(null, status: RxStatus.loading());
    final response = await videoRepository.generalEvents();
    if (response.data.isNotEmpty) {
      change(response.data, status: RxStatus.loading());
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
